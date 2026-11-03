# TMR-Fault-Tolerant-Digital-Processing-Unit
Verilog HDL implementation of a fault-tolerant digital processing unit using Triple Modular Redundancy
# Fault-Tolerant Digital Processing Unit Using Triple Modular Redundancy (TMR)

## 📌 Project Overview

This project presents a fault-tolerant digital processing unit designed using Verilog HDL and Triple Modular Redundancy (TMR).

The system consists of three identical 8-bit adder modules and a majority voter circuit. The same input operands are processed by all three modules. If one module produces an incorrect output due to a simulated fault, the majority voter selects the correct result from the other two modules.

The project also implements fault injection, fault detection, and module-wise fault indication.

## 🎯 Objectives

- Design an 8-bit binary adder using Verilog HDL.
- Implement Triple Modular Redundancy architecture.
- Design a majority voter circuit.
- Simulate a single-module fault.
- Detect disagreement between redundant modules.
- Identify the module that differs from the majority result in the simulated single-fault case.
- Verify the system using a testbench and waveform simulation.

## ⚙️ Technologies Used

- Verilog HDL
- Icarus Verilog
- EcrioniX Online Verilog Simulator
- VCD Waveform Viewer
- GitHub

## 🏗️ System Architecture

```text
          Input A ─────┬────────┬────────┐
                       │        │        │
          Input B ─────┼────────┼────────┤
                       ▼        ▼        ▼
                    Adder 1  Adder 2  Adder 3
                       │        │        │
                       │        │   Fault Injection
                       │        │        │
                       └────────┴────────┘
                                ▼
                        Majority Voter
                                │
                                ▼
                         Final 9-bit Sum
```

## 🔍 Working Principle

1. Two 8-bit binary inputs are supplied to three identical adders.
2. Each adder generates a 9-bit output to preserve carry-out.
3. Fault injection can flip the least significant bit of the third adder's output.
4. The majority voter selects the result supported by at least two modules.
5. The fault detector identifies output disagreement.
6. Module-wise fault flags indicate which output differs from the majority result in the modeled single-fault scenario.

## 🧪 Simulation Test Cases

| Test Case | Input A | Input B | Fault Enable | Expected Output |
|---|---:|---:|---:|---:|
| Normal operation | 5 | 3 | 0 | 8 |
| Fault injection | 10 | 20 | 1 | 30 |
| Carry-out test | 255 | 1 | 0 | 256 |

## 📊 Expected Fault Detection

During the fault injection test:

| Module | Output | Status |
|---|---:|---|
| Adder 1 | 30 | Healthy |
| Adder 2 | 30 | Healthy |
| Adder 3 | 31 | Faulty |
| Majority Voter | 30 | Correct |

## 📁 Repository Structure

```text
├── rtl/
│   ├── adder_8bit.v
│   ├── majority_voter.v
│   └── tmr_system.v
├── testbench/
│   └── tb_tmr_system.v
├── docs/
│   └── PROJECT_REPORT.md
├── results/
│   └── simulation_results.txt
├── README.md
├── .gitignore
└── LICENSE
```

## 🚀 Future Enhancements

- Fault injection for all three modules.
- Self-checking testbench.
- Voter fault detection.
- Extension to a fault-tolerant ALU.
- Hardware synthesis and timing analysis.

## 👨‍💻 Author

**Sharath GT**

Final-Year Electronics and Communication Engineering Student

Interested in Digital Electronics, VLSI Design, and Semiconductor Technology.

## ⚠️ Disclaimer

This is an educational RTL simulation project. The fault injection is modeled digitally and does not represent physical hardware fault testing.
