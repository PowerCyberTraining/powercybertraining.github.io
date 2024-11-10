# Modified PJM 5-bus system

## Overview
The PJM 5-bus system was originally published as early as 1999 [1]. This system includes a total of 5 buses, 6 lines, 5 generators, and 3 loads. Based on the PJM 5-bus system used in [1], our module introduces several modifications to the parameters. Further details are presented in the following sections.

[1] F. Li and R. Bo, "Small Test Systems for Power System Economic Studies," 2010 IEEE PES General Meeting, Minneapolis, MN, USA, 2010, pp. 1-4, doi: 10.1109/PES.2010.5589973.

## Generator parameters
The parameters of the generators are presented below. Each generator's ramp rate is set to 50% [2] of its maximum power output, and the minimum power output for each generator is assumed to be 20% of its maximum power output.

[2] X. Fang, F. Li, Y. Wei, and H. Cui, "Strategic scheduling of energy storage for load serving entities in locational marginal pricing market," IET Generation, Transmission & Distribution, vol. 9, no. 4, pp. 358–365, Apr. 2015, doi: 10.1049/iet-gtd.2015.0144.

| Name | Location | Ramping limit (MW) | Min (MW) | Max (MW) | Price ($/MWh) |
|------------------|----------|--------------------|--------|--------|---------------|
| Alta             | Bus A    | 55                | 22      | 110    | 14            |
| Park City        | Bus A    | 50                | 20      | 100    | 15            |
| Solitude         | Bus C    | 260               | 104     | 520    | 20            |
| Sundance         | Bus D    | 100               | 40      | 200    | 19            |
| Brighton         | Bus E    | 300               | 120     | 600    | 10            |


## Line parameters
The parameters of the lines are presented below. 

| Line | From bus | To bus | Reactance p.u. | Flow Limit MW |
|------|----------|--------|----------------|---------------|
| A-B  | A        | B      | 0.0281         | 400          |
| A-D  | A        | D      | 0.0304         | 300          |
| B-C  | B        | C      | 0.0108         | 400          |
| C-D  | C        | D      | 0.0297         | 400          |
| D-E  | D        | E      | 0.0297         | 240          |
| E-A  | E        | A      | 0.0064         | 300          |


## Load parameters
The load for each bus throughout the 24 hours is presented below.

| Bus | Hour 1 | Hour 2 | Hour 3 | Hour 4 | Hour 5 | Hour 6 | Hour 7 | Hour 8 | Hour 9 | Hour 10 | Hour 11 | Hour 12 | Hour 13 | Hour 14 | Hour 15 | Hour 16 | Hour 17 | Hour 18 | Hour 19 | Hour 20 | Hour 21 | Hour 22 | Hour 23 | Hour 24 |
|-----|--------|--------|--------|--------|--------|--------|--------|--------|--------|---------|---------|---------|---------|---------|---------|---------|---------|---------|---------|---------|---------|---------|---------|---------|
| Bus A | 0.00 | 0.00 | 0.00 | 0.00 | 0.00 | 0.00 | 0.00 | 0.00 | 0.00 | 0.00 | 0.00 | 0.00 | 0.00 | 0.00 | 0.00 | 0.00 | 0.00 | 0.00 | 0.00 | 0.00 | 0.00 | 0.00 | 0.00 | 0.00 |
| Bus B | 181.72 | 196.03 | 210.33 | 224.64 | 238.94 | 245.90 | 252.86 | 259.81 | 266.77 | 273.73 | 280.69 | 287.64 | 294.60 | 276.22 | 257.84 | 239.46 | 221.09 | 234.59 | 248.09 | 261.59 | 275.08 | 251.65 | 228.21 | 204.78 |
| Bus C | 184.62 | 194.86 | 205.11 | 215.36 | 225.60 | 235.62 | 245.64 | 255.67 | 265.69 | 275.71 | 285.73 | 295.75 | 305.77 | 289.15 | 272.53 | 255.91 | 239.30 | 251.58 | 263.86 | 276.15 | 288.43 | 262.07 | 235.70 | 209.34 |
| Bus D | 274.10 | 289.67 | 305.23 | 320.80 | 336.37 | 344.47 | 352.58 | 360.68 | 368.79 | 376.89 | 385.00 | 393.10 | 401.21 | 383.78 | 366.36 | 348.93 | 331.51 | 344.62 | 357.73 | 370.85 | 383.96 | 358.45 | 332.94 | 307.43 |
| Bus E | 0.00 | 0.00 | 0.00 | 0.00 | 0.00 | 0.00 | 0.00 | 0.00 | 0.00 | 0.00 | 0.00 | 0.00 | 0.00 | 0.00 | 0.00 | 0.00 | 0.00 | 0.00 | 0.00 | 0.00 | 0.00 | 0.00 | 0.00 | 0.00 |





