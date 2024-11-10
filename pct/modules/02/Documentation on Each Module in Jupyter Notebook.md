# Documentation on Each Module in Jupyter Notebook

## Overview

The Jupyter Notebook for this module includes the following components:

1.	Inputting system parameters and calculating the Shift Factors matrix.
2.	Formulating the optimization model and solving the optimization problem.
3.	Extracting the optimization results and displaying the outcomes.



## 1. Inputting system parameters and calculating the Shift Factors matrix

First, numpy is imported for scientific computing and efficient array operations:

```python
import numpy as np
```

To facilitate programming, we will use the terms 'generator 1', 'generator 2', 'generator 3', 'generator 4', 'generator 5' to refer respectively to the generators Alta, Park City, Solitude, Sundance, and Brighton. Similarly, 'line 1', 'line 2', 'line 3', 'line 4', 'line 5' will correspond to the lines A-B, A-D, B-C, C-D, D-E, and E-A.
Then, we record the number of generators, lines, and buses used in the modified PJM 5-bus system employed in this module, designating bus 1 as the reference bus. Additionally, we set the total number of time periods for the day-ahead economic dispatch to 24, with each period assumed to represent 1 hour:

```python
N_gen = 5
N_line = 6
bus_num = 5
ref_bus = 1 
N_interval = 24
```

Thereafter, we set generators' maximum outputs:

```python
gen_max=np.zeros(N_gen)
gen_max[0]=110
gen_max[1]=100
gen_max[2]=520
gen_max[3]=200
gen_max[4]=600
print("Gen_max:")
print(gen_max)
```

Subsequently, we set generators' minimum outputs, the minimum outputs of the generators are assumed to be 20% of their maximum outputs:
```python
gen_min=np.zeros(N_gen)
gen_min=0.2*gen_max
print("Gen_min:")
print(gen_min)
```


Afterwards, we set generators' ramping rates, the ramping rates are assumed to be 50% of their maximum outputs:
```python
gen_ramping=np.zeros(N_gen)
gen_ramping=gen_max*0.5
print("Gen_ramping:")
print(gen_ramping)
```


Next, we set the generators' costs, here we assume each unit has a fixed cost per MWh of output:
```python
gen_cost=np.zeros(N_gen)
gen_cost[0]=14
gen_cost[1]=15
gen_cost[2]=20
gen_cost[3]=19
gen_cost[4]=10
print("Gen_cost:")
print(gen_cost)
```

Then, we set the load forecast for each bus over the 24-hour period. Here, we construct a daily load profile with a dual peak, occurring at midday and in the evening.
```python
load = np.array([
    [  0.  ,   0.  ,   0.  ,   0.  ,   0.  ,   0.  ,   0.  ,   0.  ,   0.  ,   0.  ,   0.  ,   0.  ,   0.  ,   0.  ,   0.  ,   0.  ,   0.  ,   0.  ,   0.  ,   0.  ,   0.  ,   0.  ,   0.  ,   0.  ],
    [181.72, 196.03, 210.33, 224.64, 238.94, 245.9 , 252.86, 259.81, 266.77, 273.73, 280.69, 287.64, 294.6 , 276.22, 257.84, 239.46, 221.09, 234.59, 248.09, 261.59, 275.08, 251.65, 228.21, 204.78],
    [184.62, 194.86, 205.11, 215.36, 225.6 , 235.62, 245.64, 255.67, 265.69, 275.71, 285.73, 295.75, 305.77, 289.15, 272.53, 255.91, 239.3 , 251.58, 263.86, 276.15, 288.43, 262.07, 235.7 , 209.34],
    [274.1 , 289.67, 305.23, 320.8 , 336.37, 344.47, 352.58, 360.68, 368.79, 376.89, 385.  , 393.1 , 401.21, 383.78, 366.36, 348.93, 331.51, 344.62, 357.73, 370.85, 383.96, 358.45, 332.94, 307.43],
    [  0.  ,   0.  ,   0.  ,   0.  ,   0.  ,   0.  ,   0.  ,   0.  ,   0.  ,   0.  ,   0.  ,   0.  ,   0.  ,   0.  ,   0.  ,   0.  ,   0.  ,   0.  ,   0.  ,   0.  ,   0.  ,   0.  ,   0.  ,   0.  ]
])
print("Load:")
print(load)
```

Next, we set the line flow limit for each transmission line:
```python
line_max=np.zeros(N_line)
line_max[0]=400
line_max[1]=300
line_max[2]=400
line_max[3]=400
line_max[4]=240
line_max[5]=300
print("Line_flow_limit:")
print(line_max)
```

Subsequently, we set the line's impedance parameters. Here we only consider reactance:
```python
branch_data = [
    # Branch, From Bus, To Bus, Reactance (p.u.)
    (1, 1, 2, 0.0281),
    (2, 1, 4, 0.0304),
    (3, 2, 3, 0.0108),
    (4, 3, 4, 0.0297),
    (5, 4, 5, 0.0297),
    (6, 5, 1, 0.0064),        
]
```

Following this, we can calculate the B_matrix, which is the foundation for calculatig the.
```python
B_matrix = np.zeros((N_gen, N_gen))

for _, i, j, reactance in branch_data:
    i, j = i - 1, j - 1 
    Y = 1 / reactance
    B_matrix[i][j] = B_matrix[j][i] = -Y  
for i in range(N_gen):
    B_matrix[i][i] = -np.sum(B_matrix[i])  
print("B_matrix:")
print(B_matrix)
```


Based on the previously calculated B matrix, we can now calculate the system's Shift Factors matrix:
```python
def calculate_shift_factors(B_matrix, branch_data, inj_bus, ref_bus):
    n = B_matrix.shape[0]
    B_reduce = np.delete(np.delete(B_matrix, ref_bus - 1, axis=0), ref_bus - 1, axis=1)
    delta_P = np.zeros(n)    
    delta_P[ref_bus - 1] = -1 
    delta_P[inj_bus - 1] = delta_P[inj_bus - 1]+1  
    delta_P_reduce = np.delete(delta_P, ref_bus - 1, axis=0)                       
    delta_theta = np.linalg.solve(B_reduce, delta_P_reduce)   
    delta_theta = np.insert(delta_theta, ref_bus - 1, 0)
    SF_matrix = np.zeros(len(branch_data))
    for index, (branch, i, j, reactance) in enumerate(branch_data):
        i, j = i - 1, j - 1  
        SF_matrix[index] = (delta_theta[i] - delta_theta[j]) / reactance
    return SF_matrix
SF=np.zeros((N_line,bus_num))
for inj_bus in range(bus_num):    
    SF[:,inj_bus] = calculate_shift_factors(B_matrix, branch_data, inj_bus+1, ref_bus)
print("Shift Factors matrix:")
print(SF)
```


## 2. Formulating the optimization model and solving the optimization problem

The mathematical model for day-ahead economic dispatch constructed in this module is as follows:

The objective function is to minimize the generation cost, where $P_{i,t}$ represents the output of generator $i$ in time period $t$, $C_g(P_{i,t})$ denotes the generation cost of generator $i$ in time period $t$, $N_g$ is the total number of generators, and $T$ is the total number of scheduling periods.
$$
\begin{equation}
\min \sum_{i=1}^{N_g} \sum_{t=1}^{T} C_g(P_{i,t})
\end{equation}
$$
<div style="text-align: right">(1)</div>

The constraints are as follows. For example, the generator's ramping constraint,  where $\Delta P_{i}^{U}$ represents the ramp-up limit and $\Delta P_{i}^{D}$ represents the ramp-down limit.
$$
\begin{align}
P_{i,t} - P_{i,t-1} &\leq  \Delta P_{i}^{U} \\
P_{i,t-1} - P_{i,t} &\leq  \Delta P_{i}^{D}
\end{align}
$$
<div style="text-align: right">(2)</div>

System load balance constraints, where $D_{k,t}$ represents the load at bus $k$ during time period $t$, and $K$ denotes the total number of buses.
$$
\begin{equation}
\sum_{i=1}^{N_{g}} P_{i,t} \geq \sum_{k=1}^{K}D_{k,t}
\end{equation}
$$
<div style="text-align: right">(3)</div>

Line flow limit constraints, where GSF represents the shift factor matrix, and $P_{l}^{max}$ denotes the line flow limit.
$$
\begin{aligned}
-P_{l}^{max}\leq &\sum_{i=1}^{N_{i}}GSF_{l-i}*P_{i,t}-\sum_{k=1}^{N_{l}}GSF_{l-k}*D_{k,t}\leq P_{l}^{max}
\end{aligned}
$$
<div style="text-align: right">(4)</div>

Generator output limit constraints, where $P_{i}^{max}$ and $P_{i}^{min}$ represent the upper and lower output limits of generator $i$, respectively.
$$
\begin{equation}
P_{i}^{min}\leq P_{i,t}\leq P_{i}^{max}
\end{equation}
$$
<div style="text-align: right">(5)</div>

Next, we use Gurobipy [1] to model and solve this mathematical formulation.


First, if you have not installed Gurobipy, you can install it in Jupyter Notebook using the following command:

```python
get_ipython().run_line_magic('pip', 'install gurobipy')
```

Next, you need to import the entire gurobipy library and import the GRB constants from gurobipy.

```python
import gurobipy as grb
from gurobipy import GRB
```

Following this, you will use gurobipy to construct a day-ahead economic dispatch optimization model. The first steps are to create a new optimization model instance, define the decision variables, and set up the objective function.

```python
M = grb.Model()
P_i_t = M.addVars(N_gen, N_interval, vtype = GRB.CONTINUOUS, name='gen_output')
gen_fuel_cost = grb.quicksum(gen_cost[i]*(P_i_t[i,t]) for i in range(N_gen) for t in range(N_interval)) 
M.setObjective(gen_fuel_cost, GRB.MINIMIZE)
```

Next, you need to define various constraints, such as ramping constraints (In this case, we assume the ramp-up and ramp-down limits are identical):
```python
M.addConstrs((P_i_t[i,t]-P_i_t[i,t-1]<=gen_ramping[i] for i in range(N_gen)  for t in range(1,N_interval)),name='con_1')
M.addConstrs((P_i_t[i,t-1]-P_i_t[i,t]<=gen_ramping[i] for i in range(N_gen)  for t in range(1,N_interval)),name='con_2'
```


System load balance constraints:
```python
M.addConstrs((grb.quicksum(P_i_t[i,t] for i in range(N_gen)) >= 
              grb.quicksum(load[p,t] for p in range(bus_num)) for t in range(N_interval)),name='con_3')
```

Line flow limit constraints:
```python
M.addConstrs((SF[l,0]*(P_i_t[0,t]+P_i_t[1,t])+SF[l,2]*P_i_t[2,t]+SF[l,3]*P_i_t[3,t]+
              SF[l,4]*P_i_t[4,t]-(SF[l,0]*load[0,t]+SF[l,1]*load[1,t]+SF[l,2]*load[2,t]+
                                  SF[l,3]*load[3,t]+SF[l,4]*load[4,t]) <= line_max[l] 
              for l in range(N_line) for t in range(N_interval)),name='con_4')
M.addConstrs((SF[l,0]*(P_i_t[0,t]+P_i_t[1,t])+SF[l,2]*P_i_t[2,t]+SF[l,3]*P_i_t[3,t]+
              SF[l,4]*P_i_t[4,t]-(SF[l,0]*load[0,t]+SF[l,1]*load[1,t]+SF[l,2]*load[2,t]+
                                  SF[l,3]*load[3,t]+SF[l,4]*load[4,t]) >= -line_max[l] 
              for l in range(N_line) for t in range(N_interval)),name='con_5')
```


Generator output limit constraints:
```python
M.addConstrs((P_i_t[i,t] <= gen_max[i] for i in range(N_gen) for t in range(N_interval)),name='con_6')
M.addConstrs((P_i_t[i,t] >=gen_min[i]  for i in range(N_gen) for t in range(N_interval)),name='con_7')
```


Now, you can invoke Gurobi to solve this optimization problem using the following command:
```python
M.optimize()
```

## 3. Extracting the optimization results and displaying the outcomes

First, we extract the decision variables corresponding to the solution of our optimization model:
```python
P_i_t_1 = np.zeros((N_gen,N_interval+1))
for i in range(0,N_gen):
    for t in range(1,N_interval+1):
        P_i_t_1[i,t] =  P_i_t[i,t-1].X
```


Next, we import matplotlib.pyplot to display the results mentioned above.

```python
import matplotlib.pyplot as plt
```


Display the results using matplotlib.pyplot:
```python
plt.rcParams.update({'font.size': 16})  
plt.figure(figsize=(9, 5))
line_styles = ['-', '--', '-.', ':', (0, (3, 10, 1, 10))]
markers = ['o', 's', '^', 'D', 'x']
plt.plot(np.arange(1, 25), P_i_t_1[0,1:], color='red', linestyle=line_styles[0], marker=markers[0], label='gen_1')
plt.plot(np.arange(1, 25), P_i_t_1[1,1:], color='blue', linestyle=line_styles[1], marker=markers[1], label='gen_2')
plt.plot(np.arange(1, 25), P_i_t_1[2,1:], color='green', linestyle=line_styles[2], marker=markers[2], label='gen_3')
plt.plot(np.arange(1, 25), P_i_t_1[3,1:], color='orange', linestyle=line_styles[3], marker=markers[3], label='gen_4')
plt.plot(np.arange(1, 25), P_i_t_1[4,1:], color='purple', linestyle=line_styles[4], marker=markers[4], label='gen_5')
plt.legend(loc='center left', bbox_to_anchor=(1, 0.5))
plt.xlabel('Hour')  
plt.ylabel('MW')
plt.xticks(np.arange(1, 25, 1))  
plt.xlim(1, 24)
plt.ylim(0, 600)
plt.show()
```

We can also calculate each generator's cost:
```python
individual_gen_cost=np.zeros(N_gen)
for i in range(N_gen):
    individual_gen_cost[i]=gen_cost[i]*sum(P_i_t_1[i,1:])
print(f'Operating cost of individual gen {i+1}: {individual_gen_cost[i]:.2f}')
```
## References
[1] Gurobi Optimization, LLC, “Gurobi Optimizer Reference Manual,” 2023.
