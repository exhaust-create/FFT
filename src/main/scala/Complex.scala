import chisel3._

class Complex(val dataWidth: Int) extends Bundle {
  // W = real - j*imag
  val real = SInt(dataWidth.W)
  val imag = SInt(dataWidth.W)
}