// src/main/scala/FFT.scala
import chisel3._
import chisel3.util._

class FFT(val N: Int, val dataWidth: Int, val bitWidth_decimalPart: Int) extends Module {
  val io = IO(new Bundle {
    val in = Flipped(Decoupled(Vec(N, SInt(dataWidth.W))))
    val out = Decoupled(Vec(N, new Complex(dataWidth)))
  })

  // Transfer the type of input to complex.
  val inComplex = VecInit.tabulate(N) { i =>
    val complex = Wire(new Complex(dataWidth))
    complex.real := io.in.bits(i)
    complex.imag := 0.S
    complex
  }
  // for (i <- 0 until N){
  //   printf("inComplex(%d): real=%d, imag=%d\n", i.U, inComplex(i).real, inComplex(i).imag)
  // }
  val fft_input_reg = Reg(Vec(N, new Complex(dataWidth)))

  val fftStage = Module(new FFTStage(N, dataWidth, bitWidth_decimalPart))
  
  // Use state machine to control the FFT stages.
  val stage = RegInit(0.U(log2Ceil(N/2).W))
  val sIdle :: sProcessing :: sDone :: Nil = Enum(3)
  val state = RegInit(sIdle)
  val out_init = Wire(new Complex(dataWidth))
  val fft_out = Wire(Vec(N, new Complex(dataWidth)))
  out_init.real := 0.S
  out_init.imag := 0.S
  io.out.valid := false.B   // Default value
  io.in.ready := false.B

  fftStage.io.in.bits := fft_input_reg
  for (i <- 0 until N) {
    fft_out(i).real := fftStage.io.out.bits(Reverse(i.U(log2Ceil(N).W))).real   // Transfer the position of the output.
    fft_out(i).imag := -fftStage.io.out.bits(Reverse(i.U(log2Ceil(N).W))).imag   // Invert the sign bit of imaginary part.
    fft_input_reg(i) := Mux(stage === 0.U, inComplex(i), Mux(io.out.valid, fft_input_reg(i), fftStage.io.out.bits(i)))
    io.out.bits(i) := Mux(io.out.valid, fft_out(i), out_init)
  }
  fftStage.io.stage := stage
  fftStage.io.in.valid := io.in.valid
  fftStage.io.out.ready := io.out.ready

  switch (state) {
    is (sIdle) { 
      // Idle state: wait for input
      io.out.valid := false.B
      io.in.ready := true.B
      when(io.in.valid) {
        state := sProcessing
        stage := 1.U
      }
    }
    is (sProcessing) {
      // Processing state: perform FFT computation
      io.out.valid := false.B
      io.in.ready := false.B
      when(stage =/= log2Ceil(N).U - 1.U) {
        // First stage: perform butterfly operations
        state := sProcessing
      }.otherwise {
        // Second stage: perform final operations
        state := sDone
      }
      stage := stage + 1.U
    }
    is (sDone) {
      // Done state: output the result
      io.out.valid := true.B
      io.in.ready := false.B
      when(io.out.ready) {
        state := sIdle
        stage := 0.U
      } otherwise {
        state := sDone
        stage := stage
      }
    }
  }

  // Print the values after each stage
  // for (i <- 0 until N){
  //   printf("Stage %d, fft_input_reg(%d): real=%d, imag=%d" +
  //     "\n", stage, i.U, fft_input_reg(i).real, fft_input_reg(i).imag)
  // }

}