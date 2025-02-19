# Power System Co-Simulation

## Overview

This module provides an overview of transmission-and-distribution (T&D) system co-simulation.
The Hierarchical Engine for Large-scale Infrastructure Co-Simulation (HELICS) facilitates communication
between the transmission and distribution systems to enable co-simulation. ANDES serves as the transmission system
simulator, while OpenDSS is utilized for simulating the distribution system. In this framework, active and reactive
power values from the distribution federate are exchanged with the transmission system, while the voltage of the bus
is communicated to the transmission federate.

## Motivation
Modern power systems face numerous challenges in both transmission and distribution networks.
In this context, T&D co-simulation provides a holistic view of the interactions between these two systems.
It is essential for assessing the impact of behind-the-meter DER integration and for overall grid planning.

Moreover, this module aims to introduce several tools and packages, including:
- HELICS: Facilitates communication between transmission and distribution systems for co-simulation.
- ANDES: Serves as the transmission system simulator, enabling dynamic and steady-state power system analysis.
- OpenDSS: A distribution system simulator used for load flow and time-series analysis.
- Python-based APIs: Enable seamless interaction between these tools for efficient simulation and data exchange.
