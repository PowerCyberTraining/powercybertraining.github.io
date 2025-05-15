# Power System Dynamic Co-Simulation

## 1. Introduction**

The increasing integration of distributed energy resources (DERs)—including solar photovoltaics (PV), battery storage systems, and responsive loads—into distribution networks presents new challenges for maintaining the frequency stability and real-time balance of the entire power grid. Although DERs are typically connected at the distribution level, their aggregated behaviors can significantly influence transmission system dynamics, particularly during disturbances or rapid load/generation variations.

To capture these interdependencies, Transmission-and-Distribution (T&D) dynamic co-simulation has emerged as an essential approach. It enables the simultaneous simulation of transmission and distribution networks, allowing researchers and operators to study system-wide impacts of DERs with high accuracy and scalability.

### Why is T&D Dynamic Co-Simulation Important?**

**Accurate DER Frequency Response Modeling:** Captures both primary frequency response (PFR) and secondary frequency response (SFR) from DERs under various grid conditions.

**Integrated Multi-Domain Dynamics:** Simulates the electromechanical dynamics of the transmission system alongside the quasi-static time series (QSTS) behavior of the distribution system, accounting for the local voltage constraints critical to DER operation.

**Scalable for Large Systems:** Modern frameworks (e.g., based on HELICS, ANDES, and OpenDSS) allow the co-simulation of systems with thousands of transmission buses and over a million distribution nodes efficiently.

**Reflects Real-World Operation:** Considers the interaction between centralized and decentralized control layers, enabling studies on how DERs can contribute to grid services such as automatic generation control (AGC).

**Supports Grid Planning and Resilience Studies:** Assesses the impact of high DER penetration on voltage profiles, frequency recovery, and system resilience under contingencies such as generator outages.

This holistic T&D co-simulation approach is essential for the reliable and efficient operation of future power systems dominated by DERs, providing insights that are unattainable through isolated transmission or distribution simulations.

---

## 2. Co-Simulation Framework

In this module, we use **HELICS**, an advanced open-source co-simulation platform, to **connect separate transmission and distribution simulators** in a synchronized way.  

### Key Components:
```python
components = {
    "HELICS": "Acts as the central platform for data exchange and synchronization between transmission and distribution simulators.",
    "ANDES": "A transmission system simulator that performs dynamic and steady-state power system analysis, including frequency response modeling.",
    "OpenDSS": "A distribution system simulator used for power flow, time-series analysis, and voltage regulation studies.",
    "Python APIs": "Enable automation, data exchange, and seamless interaction between different simulation tools."
}
for key, value in components.items():
    print(f"- **{key}**: {value}")
```

### How the Co-Simulation Works:
```python
def co_simulation_workflow():
    steps = [
        "1. Distribution system sends active/reactive power (P, Q) values to the transmission system.",
        "2. Transmission system provides voltage and frequency signals to the distribution system.",
        "3. HELICS ensures both simulators run at the same simulation time and exchange data.",
        "4. DERs participate in primary (PFR) and secondary (SFR) frequency regulation while respecting voltage constraints."
    ]
    for step in steps:
        print(f"- {step}")
co_simulation_workflow()
```

---

## 3. Why Co-Simulation? Understanding Transmission vs. Distribution Systems

### Transmission vs. Distribution Comparison
```python
comparison = {
    "Voltage Level": ["High voltage (100 kV - 765 kV)", "Low to medium voltage (120V - 35 kV)"],
    "Purpose": ["Transfers electricity over long distances", "Distributes power to homes, businesses, and industries"],
    "Network Type": ["Typically meshed, providing redundancy", "Typically radial, leading power from substations to consumers"],
    "Control Focus": ["Frequency stability & generation control", "Voltage regulation & local reliability"]
}
import pandas as pd
pd.DataFrame(comparison, index=["Transmission System", "Distribution System"])
```

### Why Do We Need Co-Simulation?
- Transmission simulators **lack distribution network details**.
- Distribution simulators **lack frequency response models**.
- Co-simulation **bridges the gap**, allowing both to interact **realistically**.

---

## 4. Applications of T&D Co-Simulation

### ✅ 1. Studying the Impact of High DER Penetration
- **Evaluates frequency stability and voltage fluctuations**.
- Example: Simulating a **2,000-bus transmission system with 1 million distribution nodes**.

### ✅ 2. Frequency Regulation & Stability Analysis
- **DERs provide primary (PFR) and secondary (SFR) frequency response**.
- Ensures grid stability **without violating voltage constraints**.

### ✅ 3. Grid Resilience During Extreme Events
- Tests **generator failures, load fluctuations, and transmission line outages**.

### ✅ 4. Smart Grid & Demand Response Evaluation
- Simulates **smart inverters, microgrids, and flexible loads**.

---

## 5. Example Workflow of a Co-Simulation

### Step-by-Step Execution
```python
def run_cosimulation():
    print("1️⃣ Setting up Transmission & Distribution Simulators: ANDES & OpenDSS")
    print("2️⃣ Configuring HELICS for data exchange")
    print("3️⃣ Running synchronized co-simulation")
    print("4️⃣ Analyzing frequency response and voltage impact")
run_cosimulation()
```

---

## 6. Summary & Next Steps
### Key Takeaways:
✔ **T&D co-simulation enables accurate power system interaction modeling**.  
✔ **HELICS provides an efficient, scalable platform for multi-simulator coordination**.  
✔ **DERs play a crucial role in frequency and voltage regulation**.  

### Next Steps:
🔹 **Hands-on Exercise:** Try running a simple co-simulation with HELICS.  
🔹 **Advanced Topics:** Explore **cyber-physical interactions and DER market participation**.  
🔹 **Real-World Applications:** Learn how utilities use co-simulation for **grid modernization**.  

---

## Final Thoughts
T&D **co-simulation is essential for future power system research and operation**. By understanding **transmission and distribution interactions**, we can build a **resilient, efficient, and sustainable** power grid.

## Reference
[1] W. Wang, X. Fang, H. Cui, F. Li, Y. Liu and T. J. Overbye, "Transmission-and-Distribution Dynamic Co-Simulation Framework for Distributed Energy Resource Frequency Response," in IEEE Transactions on Smart Grid, vol. 13, no. 1, pp. 482-495, Jan. 2022, doi: 10.1109/TSG.2021.3118292. 
[2] Wang, Wenbo, Xin Fang, et al. "Cyber-Physical Dynamic System (CPDS) Modeling for Frequency Regulation and AGC Services of Distributed Energy Resources." , Aug. 2022. https://doi.org/10.2172/1882191
[3] Y. Liu et al., "Transmission-Distribution Dynamic Co-simulation of Electric Vehicles Providing Grid Frequency Response," 2022 IEEE Power & Energy Society General Meeting (PESGM), Denver, CO, USA, 2022, pp. 1-5, doi: 10.1109/PESGM48719.2022.9917027.

