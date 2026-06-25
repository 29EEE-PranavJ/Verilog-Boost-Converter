# DPC-Core: Digital Power Control Core

## Overview

DPC-Core is a Verilog HDL-based digital power control platform developed using MATLAB Simulink and Simscape Electrical. The project demonstrates how a digital controller can regulate a DC-DC boost converter through PWM-based switching control.

The controller is implemented in Verilog HDL and integrated into Simulink as a black-box module, enabling co-simulation between digital hardware logic and power-electronic components. This architecture serves as a foundation for future development of advanced control algorithms such as MPPT, PID, Fuzzy Logic, and FPGA-based power management systems.

---

## Objectives

* Design a digitally controlled DC-DC boost converter.
* Implement PWM generation using Verilog HDL.
* Integrate HDL logic with Simulink and Simscape Electrical.
* Study the interaction between digital control systems and power-electronic converters.
* Create a reusable power-control platform for future controller development.

---

## System Architecture

```text
Voltage Sensor      Current Sensor
       │                  │
       └──────┬───────────┘
              │
              ▼
      Verilog Controller
              │
              ▼
         PWM Generator
              │
              ▼
            MOSFET
              │
              ▼
      Boost Converter
              │
              ▼
             Load
```

---

## Key Features

* Verilog HDL-based controller
* Digital PWM generation
* HDL black-box integration in Simulink
* Simscape Electrical power stage
* Modular subsystem architecture
* Real-time duty-cycle control
* FPGA-oriented design methodology
* Expandable control framework

---

## Converter Specifications

| Parameter              | Value                                 |
| ---------------------- | ------------------------------------- |
| Converter Type         | Boost Converter                       |
| Input Voltage          | 20 V                                  |
| Inductor               | 1 mH                                  |
| Output Capacitor       | 470 µF                                |
| Load Resistance        | 50 Ω                                  |
| Controller             | Verilog HDL                           |
| Simulation Environment | MATLAB Simulink + Simscape Electrical |

---

## Working Principle

The Verilog controller generates a PWM signal that drives the MOSFET of the boost converter.

During the ON state, energy is stored in the inductor.

During the OFF state, the inductor releases its stored energy through the diode to the output capacitor and load.

By varying the PWM duty cycle, the converter increases the output voltage above the input voltage.

The sensing layer continuously monitors electrical parameters and provides feedback to the digital controller, creating a foundation for future closed-loop control implementations.

---

## Simulation Results

Observed Results:

| Parameter      | Value |
| -------------- | ----- |
| Input Voltage  | ~20 V |
| Output Voltage | ~39 V |
| Boost Ratio    | ~1.95 |

The results verify successful boost conversion and correct operation of the HDL-controlled switching system.

---

## Technologies Used

* Verilog HDL
* MATLAB
* Simulink
* Simscape Electrical
* HDL Coder
* Power Electronics

---

## Learning Outcomes

This project provided hands-on experience in:

* Digital hardware design using Verilog
* PWM generation techniques
* DC-DC boost converter operation
* Power electronics simulation
* HDL and Simulink co-simulation
* Sensor interfacing
* Modular control-system design

---

## Future Enhancements

* Perturb and Observe (P&O) MPPT
* Incremental Conductance MPPT
* PID-based regulation
* Fuzzy Logic Control
* FPGA implementation
* Hardware prototype development
* Renewable energy integration
* Advanced digital power management algorithms

---

## Author

Pranav J
