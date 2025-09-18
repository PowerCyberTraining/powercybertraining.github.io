# Power System Co-simulation

## Module Overview

Modern electric grids no longer operate as isolated transmission backbones delivering power to passive distribution feeders. Distributed energy resources (DER) now interact with high-voltage dynamics in real time. Capturing this multi-scale behaviour requires a modelling strategy that respects the distinct physics, numerical formulations, and temporal resolutions of each subsystem while still representing their mutual influence. Co-simulation provides such a strategy by orchestrating purpose-built simulators through a time-synchronised data-exchange layer. In this module we use the Hierarchical Engine for Large-scale Infrastructure Co-Simulation (HELICS) to couple transmission-level dynamic analysis in ANDES with distribution-level steady-state and quasi-dynamic analysis in OpenDSS.

### Module Structure

The notebooks progress from establishing a reproducible software environment to building, validating, and analysing increasingly sophisticated transmission–distribution (T-D) studies. Along the way you will learn:

- How HELICS manages federate registration, time negotiation, and publish–subscribe communication
- How interface variables (boundary-bus voltage magnitude, phase angle, and net complex power) should be exchanged
- How controller design, DER penetration, and forecast uncertainty shape system-wide performance

### Learning Objectives

By completing this module, you will be able to:

- Articulate the theoretical foundations of power-system co-simulation
- Configure HELICS federates for both static and dynamic time stepping
- Diagnose convergence and latency problems in multi-domain simulations
- Interpret coupled simulation results from engineering and market-operations perspectives
- Design experiments that quantify the impact of DER scheduling and control on system reliability and economics

### Prerequisites

This module builds on concepts from earlier modules, including Linux environment and Python programming. Prior exposure to ANDES or OpenDSS is helpful but not assumed; the early notebooks provide concise refreshers on the command interfaces used in the co-simulation context.
