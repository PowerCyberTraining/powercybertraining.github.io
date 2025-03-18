# Power System Co-Simulation

## 1. Introduction
Modern power systems are becoming increasingly complex due to the growing integration of **distributed energy resources (DERs)** such as **solar photovoltaics (PV), battery storage, and demand response programs**. These resources are connected to **distribution networks**, but their operations significantly impact the **transmission system**.  

To study these interactions, researchers and engineers use **Transmission-and-Distribution (T&D) co-simulation**—a technique that simulates both transmission and distribution networks **simultaneously**, capturing their real-world interdependencies.  

### Why is T&D Co-Simulation Important?
- **Accurately models DER behavior** and their effect on the grid.
- **Improves power system stability analysis** by considering both high-voltage transmission and low-voltage distribution networks.
- **Optimizes grid planning and operations** under real-world conditions.
- **Evaluates the role of DERs** in providing frequency response services, ensuring a **balanced and reliable** power system.

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

