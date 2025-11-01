// test/scala/FFTTest.scala
import chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec
import chisel3.util.RegEnable
import chiseltest.simulator.{SimulatorAnnotation}

abstract class BaseFFTTest extends AnyFlatSpec with ChiselScalatestTester {
  
  // Set the parameters for the FFT
  val DATA_WIDTH = 32
  val BINARY_POINT = 12

  protected def DefaultBackend: SimulatorAnnotation = TreadleBackendAnnotation
  def annotations = Seq(DefaultBackend)

  // 通用的测试逻辑
  def runFFTTest(testName: String = "process test vectors correctly"): Unit = {
    // Begin Test
    "FFT" should testName in {
      // Load or create test vectors
      val testVectors = FFTTestUtils.loadTestVectors("/home/cmj/FFT/fft_test_vectors.json").getOrElse {
        println("JSON file not found")
        TestVectors(Array(), Array(), Array())
      }

      val FFT_SIZE = testVectors.inputReal.length   // Depends on the test vector size
      assert((FFT_SIZE & (FFT_SIZE - 1)) == 0 && FFT_SIZE >= 2, "FFT size must be a power of two and at least 2")
      println(s"Testing FFT with size: $FFT_SIZE")
      
      FFTTestUtils.printTestVectors(testVectors)
      
      // The total cycles of this FFT is (log2(FFT_SIZE) + 1)
      test(new FFT(FFT_SIZE, DATA_WIDTH, BINARY_POINT)).withAnnotations(annotations) { dut =>
        
        // Initialize
        dut.io.in.valid.poke(false.B)
        dut.io.out.ready.poke(false.B)
        dut.clock.step(1)
        
        // Prepare input data
        dut.io.in.valid.poke(true.B)
        for (i <- 0 until FFT_SIZE) {
          val realValue = FFTTestUtils.doubleToFixedPointValue(testVectors.inputReal(i), BINARY_POINT)
          val restored_realValue = FFTTestUtils.fixedPointToDouble(realValue.S(DATA_WIDTH.W), BINARY_POINT)
          // println(f"Input [$i] original: ${testVectors.inputReal(i)}%.6f, fixed-point: $realValue, restored: $restored_realValue%.6f")
          
          dut.io.in.bits(i).poke(realValue.S(DATA_WIDTH.W))
        }
        
        // Process data
        dut.clock.step(1)
        dut.io.in.valid.poke(false.B)
        dut.io.out.ready.poke(true.B)
        
        // Wait for output (adjust timeout based on FFT size)
        val timeout = FFT_SIZE * 2 + 10
        var cycles = 0
        while (!dut.io.out.valid.peek().litToBoolean && cycles < timeout) {
          dut.clock.step(1)
          cycles += 1
        }

        dut.io.out.valid.expect(true.B)

        // Read and verify output
        val actualReal = new Array[Double](FFT_SIZE)
        val actualImag = new Array[Double](FFT_SIZE)
        
        for (i <- 0 until FFT_SIZE) {
          actualReal(i) = FFTTestUtils.fixedPointToDouble(dut.io.out.bits(i).real.peek(), BINARY_POINT)
          actualImag(i) = FFTTestUtils.fixedPointToDouble(dut.io.out.bits(i).imag.peek(), BINARY_POINT)
        }

        dut.clock.step(1) // Reset the FFT
        
        if (cycles >= timeout) {
          fail(s"Timeout after $cycles cycles waiting for FFT output")
        }

        println("Actual Output:")
        for (i <- 0 until 10) {
          println(f"  [$i] ${actualReal(i)}%.6f + ${actualImag(i)}%.6fi")
        }

        val rmse = FFTTestUtils.calculateComplexRMSE(
          actualReal, actualImag,
          testVectors.outputReal, testVectors.outputImag
        )
        
        println(f"RMSE: $rmse%.6f")
        assert(rmse < 0.1, f"RMSE $rmse%.6f exceeds threshold")
      }
    }
  }
}

class FFTTest extends BaseFFTTest {
  runFFTTest()
}

class FFTTest_withVerilator extends BaseFFTTest {
  override def annotations = Seq(VerilatorBackendAnnotation)
  runFFTTest("process test vectors correctly with Verilator")
}

class FFTTest_withIverilog extends BaseFFTTest {
  override def annotations = Seq(IcarusBackendAnnotation)
  runFFTTest("process test vectors correctly with Iverilog")
}