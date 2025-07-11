# GShare Branch Predictor in Verilog

## Overview
This project implements a **GShare Branch Predictor** using **Verilog HDL**. It simulates how modern processors predict the outcome of conditional branches using a combination of the **Global History Register (GHR)** and **Pattern History Table (PHT)** indexed through an XOR operation.

##  Features
- 8-bit Global History Register (GHR)
- 256-entry Pattern History Table (PHT)
- 2-bit saturating counters for prediction
- Indexing using GHR ⊕ PC[7:0]
- Testbench for simulation and waveform analysis
- Generates waveform `.vcd` file for GTKWave

## Tools Used
- **Verilog HDL**
- **EDA Playground / GTKWave**
- Synopsys VCS (optional).

##  How to Run
1. Clone the repo or open files in [EDA Playground](https://edaplayground.com).
2. Load all `.v` files.
3. Run the testbench.
4. Observe waveforms using EPWave viewer.

## Output
- **predict_taken** signal evolves based on branch history.
- GHR shifts with every resolved branch.
- PHT values saturate towards correct prediction over time.

## Acknowledgments
- RISC-V ISA specifications
- Berkeley Rocket Core (GShare concepts)
- Verilog reference documentation








