import chisel3._
import chisel3.stage.{ChiselStage, ChiselGeneratorAnnotation}

case class Config(
  numPoints: Int = 16,
  datawidth: Int = 32,
  bitWidth_decimalPart: Int = 16,
  outputDir: String = "generated",
  moduleName: String = "FFT"
)

object FFT_GenVerilog extends App {
  
  val parser = new scopt.OptionParser[Config]("FFT_Generator") {
    head("FFT Generator", "1.0")
    
    opt[Int]('p', "numPoints")
      .action((x, c) => c.copy(numPoints = x))
      .text("number of FFT points (must be a power of two)")
      .validate(x => 
        if (x >= 2 && (x & (x - 1)) == 0) success 
        else failure("numPoints must be a power of two and at least 2")
      )

    opt[Int]('w', "datawidth")
      .action((x, c) => c.copy(datawidth = x))
      .text("bitwidth of each data point")
      .validate(x => 
        if (x > 0) success 
        else failure("Width must be a positive integer")
      )
    
    opt[Int]('d', "bitWidth_decimalPart")
      .action((x, c) => c.copy(bitWidth_decimalPart = x))
      .text("number of bits for the decimal part in fixed-point representation")
      .validate(x => 
        if (x >= 0) success 
        else failure("bitWidth_decimalPart must be a non-negative integer")
      )
    
    opt[String]('o', "output-dir")
      .action((x, c) => c.copy(outputDir = x))
      .text("output directory for Verilog")
    
    help("help").text("print this usage text")
  }
  
  parser.parse(args, Config()) match {
    case Some(config) =>
      println(s"Generating ${config.moduleName} with:")
      println(s"  Number of Points: ${config.numPoints}")
      println(s"  BitWidth of a Point: ${config.datawidth}")
      println(s"  BitWidth of the Decimal Part: ${config.bitWidth_decimalPart}")
      println(s"  Output directory: ${config.outputDir}")
      
      if (config.datawidth <= config.bitWidth_decimalPart) {
        println("Error: datawidth must be greater than bitWidth_decimalPart")
        sys.exit(1)
      }

      (new ChiselStage).execute(
        Array(
          "-X", "verilog",
          "--target-dir", config.outputDir
        ),
        Seq(ChiselGeneratorAnnotation(() => new FFT(config.numPoints, config.datawidth, config.bitWidth_decimalPart)))
      )
      
    case None =>
      // 参数解析失败，错误信息已由 scopt 打印
      sys.exit(1)
  }
}