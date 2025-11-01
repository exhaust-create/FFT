# FFT
FFT written in Chisel, tested with iverilog and verilator.
# Environment
The versions of Chisel, Scala, etc., are shown in the file "build.sbt". To run the test based on Chisel, you should have installed Chisel, Scala, *iverilog* or *verilator* first. Otherwise, you can run the file "./generated/FFT.v" on Vivado, but the testbench should be written by yourself.
# Test Command
Choose one of these commands to generate verilog or test the FFT circuit.
```
# Generate verilog from the file ./src/main/scala/FFT_GenVerilog.scala
make verilog

# Test with verilator
make sim-verilator

# Test with iverilog
make sim-iverilog
```
