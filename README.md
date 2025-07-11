Overview:
This project implements a GShare Branch Predictor using Verilog HDL. It simulates how modern processors predict the outcome of conditional branches using a combination of the Global History Register (GHR) and Pattern History Table (PHT) indexed through an XOR operation.

Features:
1.8-bit Global History Register (GHR)
2.256-entry Pattern History Table (PHT)
3.2-bit saturating counters for prediction
4.Indexing using GHR ⊕ PC[7:0]
5.Testbench for simulation and waveform analysis
6.Generates waveform .vcd file for GTKWave# Verilog-Based-Branch-Predictor

Tools Used:
1.Verilog HDL
2.EDA Playground / GTKWave
3.Synopsys VCS (optional).

Output:
1.predict_taken signal evolves based on branch history.
2.GHR shifts with every resolved branch.
3.PHT values saturate towards correct prediction over time.







