import numpy as np

# Sample Input vector
x = np.random.rand(64) + 1j * np.zeros(64)

# Golden FFT output
golden_output = np.fft.fft(x)

# Save inputs and outputs to file for use by the Chisel testbench
import json
data = {'input_real': x.real.tolist(), 'output_real': golden_output.real.tolist(), 'output_imag': golden_output.imag.tolist()}
with open('fft_test_vectors.json', 'w') as f:
    json.dump(data, f)