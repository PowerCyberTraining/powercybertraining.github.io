# Co-Simulation Environment Setup

## Motivation

Power system co-simulation represents a critical advancement in cyber-physical system modeling, enabling the coordinated simulation of transmission and distribution networks. This approach addresses the growing need to understand the interactions between different levels of the power system hierarchy, particularly as distributed energy resources become more prevalent.

The integration of multiple simulation platforms requires careful environment configuration and dependency management. This module provides comprehensive guidance for establishing a robust co-simulation development environment using industry-standard tools and best practices established in previous modules.

## Prerequisites

This installation guide assumes familiarity with the tools and concepts introduced in Module 01, including:

- Windows Subsystem for Linux (WSL) with Ubuntu 20.04 or later
- Command line interface navigation
- Python package management with conda/mamba
- Basic understanding of virtual environments

### System Requirements

- WSL Ubuntu 20.04 or newer
- Python 3.9 or later (recommended: 3.9+)
- Minimum 4GB available disk space
- Active internet connection for package downloads
- Existing miniforge installation (covered in Module 01)

## Installation Overview

We will install and configure four main components:

1. **Scientific Computing Foundation**: NumPy, SciPy, matplotlib, and related packages
2. **HELICS**: Co-simulation coordination platform
3. **ANDES**: Transmission system dynamic simulation
4. **OpenDSSDirect.py**: Distribution system modeling and analysis

The installation follows the established pattern from Module 01 of using conda/mamba for environment management and preferring conda packages when available, with pip as a fallback for packages not available through conda-forge.

## Step 1: Environment Verification

Begin by verifying the WSL Ubuntu installation and miniforge setup:

```bash
# Verify Ubuntu version
lsb_release -a

# Check mamba installation
mamba --version
```

Expected output should show Ubuntu 20.04 or newer. The mamba command should execute without errors.

## Step 2: Create Co-Simulation Environment

Create a dedicated conda environment for co-simulation work:

```bash
# Create new environment with Python 3.9
mamba create -n cosim python=3.9

# Activate the environment
mamba activate cosim
```

Verify activation by checking that the terminal prompt now displays `(cosim)` at the beginning. This isolated environment will contain all co-simulation dependencies without affecting other projects.

## Step 3: HELICS Installation

HELICS serves as the co-simulation coordination platform. Install using pip as it provides the most recent version:

```bash
# Install HELICS with CLI extensions
python -m pip install 'helics[cli]' jupyterlab seaborn

# Verify installation
python -c "import helics as h; print(f'HELICS version: {h.helicsGetVersion()}')"
```

The installation should complete without errors and display the HELICS version (expected: 3.6.1 or later).

## Step 4: ANDES Installation

ANDES provides transmission system simulation capabilities. Install via pip:

```bash
# Install ANDES
pip install andes

# Verify installation
andes misc --version

# Run self-test to confirm functionality
andes selftest
```

The self-test may take several minutes to complete. Minor test failures are acceptable for basic functionality, but core tests should pass.

## Step 5: OpenDSS Installation

Install OpenDSSDirect.py for distribution system simulation:

```bash
# Install with full feature set
pip install opendssdirect.py

# Verify installation
python -c "import opendssdirect as dss; print('OpenDSS installation verified')"
```

Note that OpenDSSDirect.py includes its own OpenDSS engine, eliminating the need for a separate OpenDSS installation.

## Installation Verification

Create a comprehensive verification script to confirm all components are properly installed:

```bash
cat > verify_installation.py << 'EOF'
#!/usr/bin/env python3
"""
Co-simulation environment verification script
"""

import sys
import traceback

def test_component(name, test_func):
    """Test a component and report results"""
    try:
        test_func()
        print(f"✓ {name}: OK")
        return True
    except Exception as e:
        print(f"✗ {name}: FAILED - {str(e)}")
        return False

def test_scientific_stack():
    """Test scientific computing packages"""
    import numpy as np
    import scipy
    import matplotlib.pyplot as plt
    import pandas as pd
    assert np.__version__
    assert scipy.__version__

def test_helics():
    """Test HELICS installation"""
    import helics as h
    version = h.helicsGetVersion()
    assert version
    return version

def test_andes():
    """Test ANDES installation"""
    import andes
    assert hasattr(andes, '__version__')

def test_opendss():
    """Test OpenDSS installation"""
    import opendssdirect as dss
    assert hasattr(dss, '__version__')

def test_graphics():
    """Test graphics capabilities"""
    import matplotlib.pyplot as plt
    plt.figure(figsize=(6, 4))
    plt.plot([1, 2, 3, 4], [1, 4, 2, 3])
    plt.title("Installation Verification Plot")
    plt.savefig("verification_plot.png")
    plt.close()

def main():
    """Run all verification tests"""
    print("Co-simulation Environment Verification")
    print("=" * 40)
    print(f"Python version: {sys.version.split()[0]}")
    print()

    tests = [
        ("Scientific Computing Stack", test_scientific_stack),
        ("HELICS", test_helics),
        ("ANDES", test_andes),
        ("OpenDSS", test_opendss),
        ("Graphics/Plotting", test_graphics)
    ]

    results = []
    for name, test_func in tests:
        results.append(test_component(name, test_func))

    print()
    if all(results):
        print("✓ All components verified successfully!")
        print("Environment ready for co-simulation work.")
    else:
        print("⚠ Some components failed verification.")
        print("Review error messages and consult troubleshooting section.")

    print("\nVerification plot saved as 'verification_plot.png'")

if __name__ == "__main__":
    main()
EOF

# Run verification
python verify_installation.py
rm verify_installation.py
```

## Troubleshooting

### Common Issues and Solutions

**Issue**: `mamba: command not found`
**Solution**: Ensure miniforge is properly installed and shell is restarted:
```bash
source ~/.bashrc
# or
exec bash
```

**Issue**: Package installation fails with "No space left on device"
**Solution**: Check available disk space and clean package cache:
```bash
df -h
mamba clean --all
```

**Issue**: ANDES selftest failures
**Solution**: Verify core functionality directly:
```bash
python -c "
import andes
ss = andes.System()
print('ANDES core functionality confirmed')
"
```

**Issue**: Import errors after installation
**Solution**: Confirm environment activation:
```bash
mamba activate cosim
# Verify correct Python path
which python
```

### HELICS Import Error in Jupyter

**Issue**: HELICS imports successfully in Python/IPython but fails in Jupyter with error:
```
OSError: cannot load library '.../libhelics.so': undefined symbol: _ZNSt8ios_base4Init11_S_refcountE
```

**Cause**: Incompatible C++ runtime library between Python packages compiled in conda-forge and HELICS.

Solution: Install all Python packages using `pip`. Do not use `mamba` to install dependencies.

## References and Resources

- HELICS Documentation: https://python.helics.org/
- ANDES Documentation: https://docs.andes.app/
- OpenDSSDirect.py Documentation: https://dss-extensions.org/OpenDSSDirect.py/
- Conda Package Management: https://docs.conda.io/

## Next Steps

With the co-simulation environment properly configured, subsequent modules will cover:

- Module 06-02: HELICS fundamentals and basic federate communication
- Module 06-03: Power system modeling concepts for co-simulation
- Module 06-04: Implementation of transmission-distribution co-simulation

The established environment provides the foundation for advanced power system co-simulation studies and research applications.