import chisel3._
import chisel3.util._
import chisel3.experimental.FixedPoint

object TwiddleROM {
  /**
    * 生成 FFT 旋转因子 ROM
    * @param N: FFT 点数为 2^N
    * @param dataWidth: 每个实部/虚部的位宽
    * @param fracBits: 小数部分位宽
    * @return ROM 输出，类型为 Vec[Complex]
    */
  def apply(N: Int, dataWidth: Int, fracBits: Int): Vec[Complex] = {
    val numEntries = 1 << (log2Ceil(N) - 1)  // 对于实数对称性，只需前 N/2 个
    val angleStep = 2 * math.Pi / (1 << log2Ceil(N))

    // 生成查找表
    val table = (0 until numEntries).map { i =>
      val angle = angleStep * i
      val cosVal = math.cos(angle)
      val sinVal = math.sin(angle)

      // 缩放为定点数：value * 2^fracBits
      val scale = (1 << fracBits).toDouble
      val real = ((cosVal * scale).round).toInt
      val imag = ((sinVal * scale).round).toInt

      // 创建 Complex 实例
      val c = Wire(new Complex(dataWidth))
      c.real := real.S(dataWidth.W)
      c.imag := imag.S(dataWidth.W)
      c
    }

    // 生成 ROM
    VecInit(table)
  }
}