// src/main/scala/FFTStage.scala
import chisel3._
import chisel3.util._

class FFTStage(val N: Int, val dataWidth: Int, val bitWidth_decimalPart: Int) extends Module {
  val stage_width = log2Ceil(N/2)

  val io = IO(new Bundle {
    val in = Flipped(DecoupledIO(Vec(N, new Complex(dataWidth))))
    val out = DecoupledIO(Vec(N, new Complex(dataWidth)))
    val stage = Input(UInt(stage_width.W))  // Range [1, log2Ceil(N))
  })
  
  val outVec = Wire(Vec(N, new Complex(dataWidth)))
  val zeroComplex = Wire(new Complex(dataWidth))
  zeroComplex.real := 0.S
  zeroComplex.imag := 0.S
  outVec := VecInit(Seq.fill(N)(zeroComplex))  // 所有元素初始化为 0

  io.in.ready := io.in.valid    // Just inside a clock, so have nothing to do with `valid` and `ready`.
  io.out.valid := io.in.valid

  // Omega Look-Up Table
  // TODO: Use `SyncReadMem` to produce a Memory.
  val OmegaLUT = TwiddleROM(N, dataWidth, bitWidth_decimalPart)
  // for (i <- 0 until (N / 2)) {
  //   printf("OmegaLUT(%d): real=%d, imag=%d" +
  //         "\n", i.U, OmegaLUT(i).real, OmegaLUT(i).imag)
  // }

  val butterflys = Seq.fill(N/2) {Module(new ButterflyUnit(dataWidth, bitWidth_decimalPart))}
  
  val k_width = log2Ceil(N).asUInt - io.stage
  for (i <- 0 until N / 2) {
    val k = (0.U(stage_width.W) + i.U) & ((1.U << k_width) - 1.U)  // Get the last `k_width` bits of i. k(2.W) = [0,1,2,3]->[0,1]->[0]
    val k_s = ((i.U >> k_width) << (log2Ceil(N).asUInt - (io.stage - 1.U))) + k  // (i >> k_width) *(N/2^(stage - 1)) + k
    val t = k_s + (N.U >> io.stage)   // k_s + N/2^(stage) + k
    val w_idx = k << (io.stage - 1.U)  // k * 2^(stage - 1)
    // printf("Stage %d, butterfly_id %d, k=%d, k_s=%d, t=%d, w_idx=%d" +
    //       "\n", io.stage, i.U, k, k_s, t, w_idx)
    butterflys(i).io.x_k_s := io.in.bits(k_s)
    butterflys(i).io.x_t := io.in.bits(t)
    butterflys(i).io.w := OmegaLUT(w_idx)  // k * 2^(stage - 1)
    // printf("Stage %d, butterfly_id %d, w.real=%d, w.imag=%d" +
    //       "\n", io.stage, i.U, butterflys(i).io.w.real, butterflys(i).io.w.imag)
    // printf("Stage %d, butterfly_id %d: out(0).real=%d, out(0).imag=%d, out(1).real=%d, out(1).imag=%d" +
    //     "\n", io.stage, i.U, butterflys(i).io.out(0).real, butterflys(i).io.out(0).imag, butterflys(i).io.out(1).real, butterflys(i).io.out(1).imag)
    // io.out.bits(k_s) := butterflys(i).out(0)     // Not allow to partially assignment.
    // io.out.bits(t) := butterflys(i).out(1)
    outVec(k_s) := butterflys(i).io.out(0)
    outVec(t) := butterflys(i).io.out(1)
    // printf("Stage %d, outVec(%d): real=%d, imag=%d" +
    //       "\n", io.stage, k_s, outVec(k_s).real, outVec(k_s).imag)
    // printf("Stage %d, outVec(%d): real=%d, imag=%d" +
    //       "\n", io.stage, t, outVec(t).real, outVec(t).imag)
  }
  io.out.bits.zip(outVec).foreach { case (outBit, outVal) => outBit := outVal }
  // for (i <- 0 until N) {
  //   printf("Stage %d, io.out.bits(%d): real=%d, imag=%d" +
  //     "\n", io.stage, i.U, io.out.bits(i).real, io.out.bits(i).imag)
  // }
}