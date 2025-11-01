// test/scala/FFTTestUtils.scala
import scala.io.Source
import scala.util.{Try, Success, Failure}
import java.io.File
import chisel3._
import chisel3.util._
import play.api.libs.json._ // 添加JSON解析库

case class TestVectors(inputReal: Array[Double], outputReal: Array[Double], outputImag: Array[Double])

object FFTTestUtils {
  
  // 首先在build.sbt中添加依赖：libraryDependencies += "com.typesafe.play" %% "play-json" % "2.9.4" % "test"
  
  // 方法1: 使用Play JSON库（推荐）
  def loadTestVectors(jsonPath: String): Try[TestVectors] = Try {
    val file = new File(jsonPath)
    
    if (!file.exists() || !file.canRead()) {
      throw new RuntimeException(s"Cannot read file: $jsonPath")
    }
    
    println(s"Loading test vectors from: ${file.getAbsolutePath}")
    
    val source = Source.fromFile(file)
    try {
      val jsonString = source.getLines().mkString
      println(s"JSON content length: ${jsonString.length} characters")
      
      // 使用Play JSON库解析
      val json = Json.parse(jsonString)
      
      val inputReal = (json \ "input_real").as[Array[Double]]
      val outputReal = (json \ "output_real").as[Array[Double]]
      val outputImag = (json \ "output_imag").as[Array[Double]]

      println(s"Parsed: input_real=${inputReal.length}, output_real=${outputReal.length}, " +
              s"output_imag=${outputImag.length}")

      TestVectors(inputReal, outputReal, outputImag)
      
    } finally {
      source.close()
    }
  }
  
  // 方法2: 改进的正则表达式方法（备用）
  def loadTestVectorsRegex(jsonPath: String): Try[TestVectors] = Try {
    val source = Source.fromFile(jsonPath)
    try {
      val jsonString = source.getLines().mkString
      println(s"JSON content: ${jsonString.take(100)}...")
      
      // 更灵活的正则表达式
      def extractArray(pattern: String): Array[Double] = {
        // 匹配模式： "pattern": [数字, 数字, ...]
        val regex = s""""$pattern"\\s*:\\s*\\[([^\\]]+)\\]""".r
        regex.findFirstMatchIn(jsonString) match {
          case Some(m) =>
            val arrayStr = m.group(1)
            println(s"Found $pattern: $arrayStr")
            arrayStr.split("\\s*,\\s*")
              .map(_.trim)
              .filter(_.nonEmpty)
              .map(_.toDouble)
          case None =>
            // 尝试另一种格式
            val altRegex = s""""$pattern"\\s*:\\s*\\[\\s*([0-9.,\\s]+)\\]""".r
            altRegex.findFirstMatchIn(jsonString) match {
              case Some(m) =>
                val arrayStr = m.group(1)
                println(s"Found $pattern (alt format): $arrayStr")
                arrayStr.split("\\s*,\\s*")
                  .map(_.trim)
                  .filter(_.nonEmpty)
                  .map(_.toDouble)
              case None =>
                throw new RuntimeException(s"Pattern $pattern not found in JSON")
            }
        }
      }
      
      val inputReal = extractArray("input_real")
      val outputReal = extractArray("output_real")
      val outputImag = extractArray("output_imag")
      
      TestVectors(inputReal, outputReal, outputImag)
      
    } finally {
      source.close()
    }
  }
  
  // 方法3: 简单的字符串分割方法
  def loadTestVectorsSimple(jsonPath: String): Try[TestVectors] = Try {
    val source = Source.fromFile(jsonPath)
    try {
      val jsonString = source.getLines().mkString
      
      // 简单的字符串操作
      def extractArraySimple(key: String): Array[Double] = {
        val keyPattern = s""""$key":"""
        val start = jsonString.indexOf(keyPattern)
        if (start == -1) throw new RuntimeException(s"Key $key not found")
        
        val bracketStart = jsonString.indexOf('[', start)
        val bracketEnd = jsonString.indexOf(']', bracketStart)
        
        if (bracketStart == -1 || bracketEnd == -1) {
          throw new RuntimeException(s"Array brackets not found for $key")
        }
        
        val arrayContent = jsonString.substring(bracketStart + 1, bracketEnd)
        arrayContent.split(",")
          .map(_.trim.replace("\"", ""))
          .filter(_.nonEmpty)
          .map(_.toDouble)
      }
      
      TestVectors(
        extractArraySimple("input_real"),
        extractArraySimple("output_real"),
        extractArraySimple("output_imag")
      )
      
    } finally {
      source.close()
    }
  }
  
  // Chisel 3.5 compatible fixed-point conversion - SIMPLIFIED VERSION
  // This method just returns the integer value, use it with .S(width.W) in poke
  def doubleToFixedPointValue(value: Double, bp: Int): Int = {
    ((value * (1 << bp)).round).toInt
  }
  
  // Convert fixed-point SInt to double
  def fixedPointToDouble(value: chisel3.SInt, bp: Int): Double = {
    value.litValue.toDouble / (1 << bp)
  }
  
  // Calculate RMS error
  def calculateRMSE(actual: Array[Double], expected: Array[Double]): Double = {
    require(actual.length == expected.length, "Arrays must have same length")
    
    val squaredErrors = actual.zip(expected).map { case (a, e) => 
      (a - e) * (a - e)
    }
    math.sqrt(squaredErrors.sum / actual.length)
  }
  
  // Calculate complex RMS error
  def calculateComplexRMSE(actualReal: Array[Double], actualImag: Array[Double],
                          expectedReal: Array[Double], expectedImag: Array[Double]): Double = {
    require(actualReal.length == expectedReal.length && actualImag.length == expectedImag.length,
            "Arrays must have same length")
    
    val squaredErrors = actualReal.zip(actualImag).zip(expectedReal.zip(expectedImag)).map {
      case ((actReal, actImag), (expReal, expImag)) =>
        val realError = actReal - expReal
        val imagError = actImag - expImag
        realError * realError + imagError * imagError
    }
    
    math.sqrt(squaredErrors.sum / actualReal.length)
  }
  
  // Print test vectors for debugging
  def printTestVectors(vectors: TestVectors, maxSamples: Int = 10): Unit = {
    val n = vectors.inputReal.length
    val displaySamples = math.min(n, maxSamples)
    
    println(s"=== Test Vectors (showing $displaySamples/$n samples) ===")
    
    println("Input Data:")
    for (i <- 0 until displaySamples) {
      println(f"  [$i] ${vectors.inputReal(i)}%.6f")
    }
    if (n > displaySamples) println(s"  ... and ${n - displaySamples} more")
    
    println("Expected Output:")
    for (i <- 0 until displaySamples) {
      println(f"  [$i] ${vectors.outputReal(i)}%.6f + ${vectors.outputImag(i)}%.6fi")
    }
    if (n > displaySamples) println(s"  ... and ${n - displaySamples} more")
    println("====================")
  }
  
  // Get FFT size from test vectors
  def getFFTSize(vectors: TestVectors): Int = {
    vectors.inputReal.length
  }
}