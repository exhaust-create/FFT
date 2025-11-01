import chisel3._

class ButterflyUnit(val dataWidth: Int, val bitWidth_decimalPart: Int) extends Module {
  val io = IO(new Bundle {
    val x_k_s= Input(new Complex(dataWidth))
    val x_t = Input(new Complex(dataWidth))
    val w = Input(new Complex(dataWidth))
    val out = Vec(2, Output(new Complex(dataWidth)))  // +2 for potential overflow
  })
  
  // For out(0)
  io.out(0).real := io.x_k_s.real + io.x_t.real
  io.out(0).imag := io.x_k_s.imag + io.x_t.imag

  // For out(1)
  val out_part = Wire(new Complex(dataWidth))
  val out_part_withOmega = Wire(new Complex(dataWidth))
  out_part.real := io.x_k_s.real - io.x_t.real
  out_part.imag := io.x_k_s.imag - io.x_t.imag
  // For Real Part
  val out_part_withOmega_real = out_part.real * io.w.real - out_part.imag * io.w.imag
  val rounded_real = (out_part_withOmega_real + (1.S << (bitWidth_decimalPart - 1))) >> bitWidth_decimalPart  // Rounding
  out_part_withOmega.real := rounded_real(dataWidth-1,0).asSInt
  // For Imag Part
  val out_part_withOmega_imag = out_part.real * io.w.imag + out_part.imag * io.w.real
  val rounded_imag = (out_part_withOmega_imag + (1.S << (bitWidth_decimalPart - 1))) >> bitWidth_decimalPart  // Rounding
  out_part_withOmega.imag := rounded_imag(dataWidth-1,0).asSInt

  io.out(1).real := out_part_withOmega.real
  io.out(1).imag := out_part_withOmega.imag
  
}