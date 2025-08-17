# Power System Co-simulation

### Overview

Modern electric grids no longer operate as isolated transmission backbones delivering power to passive distribution feeders. Distributed energy resources (DER)—solar photovoltaics, battery storage, smart inverters, controllable loads—now interact with high-voltage dynamics in real time. Capturing this multi-scale behaviour requires a modelling strategy that respects the distinct physics, numerical formulations, and temporal resolutions of each subsystem while still representing their mutual influence. Co-simulation provides such a strategy by orchestrating purpose-built simulators through a time-synchronised data-exchange layer. In this module we use the Hierarchical Engine for Large-scale Infrastructure Co-Simulation (HELICS) to couple transmission-level dynamic analysis in ANDES with distribution-level steady-state and quasi-dynamic analysis in OpenDSS.

### Module Structure

The notebooks progress from establishing a reproducible software environment to building, validating, and analysing increasingly sophisticated transmission–distribution (T-D) studies. Along the way you will learn:

- How HELICS manages federate registration, time negotiation, and publish–subscribe communication
- How interface variables (boundary-bus voltage magnitude, phase angle, and net complex power) should be exchanged
- How controller design, DER penetration, and forecast uncertainty shape system-wide performance

The final case studies mirror current research questions—for example, how feeder-level voltage regulation by smart inverters propagates to locational marginal prices, or how high-resolution solar variability influences inter-area oscillations—demonstrating why co-simulation has become indispensable for grid modernization research.

### Learning Objectives

By completing this module, you will be able to:

- Articulate the theoretical foundations of power-system co-simulation
- Configure HELICS federates for both static and dynamic time stepping
- Diagnose convergence and latency problems in multi-domain simulations
- Interpret coupled simulation results from engineering and market-operations perspectives
- Design experiments that quantify the impact of DER scheduling and control on system reliability and economics

### Prerequisites

This module builds on concepts from earlier modules:

- Module 1: Linux-based development workflow, environment management
- Module 2: Python programming and scientific computing skills
- Module 3: Optimisation concepts and electricity market fundamentals
- Module 4: Power-flow and dynamic-equation fundamentals

Prior exposure to ANDES or OpenDSS is helpful but not assumed; the early notebooks provide concise refreshers on the command interfaces used in the co-simulation context.