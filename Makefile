test:
	sbt -J-Xmx6g -J-XX:+UseG1GC "testOnly FFTTest" >test.log

verilog:
	sbt -J-Xmx6g -J-XX:+UseG1GC "runMain FFT_GenVerilog -p 16 -w 32 -d 16 -o generated"

sim-verilator:
	sbt -J-Xmx6g -J-XX:+UseG1GC "testOnly FFTTest_withVerilator" >sim-verilator.log

sim-iverilog:
	sbt -J-Xmx6g -J-XX:+UseG1GC "testOnly FFTTest_withIverilog" >sim-iverilog.log