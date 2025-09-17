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
- Python 3.8 or later (recommended: 3.10+)
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

# Confirm Python availability
python3 --version

# Check mamba installation
mamba --version
```

Expected output should show Ubuntu 20.04 or newer and Python 3.8 or later. The mamba command should execute without errors.

## Step 2: System Dependencies

Install essential system-level packages required for scientific computing:

```bash
# Update package repositories
sudo apt update

# Install development tools and libraries
sudo apt install -y build-essential

# Install system libraries for graphics and numerical computing
sudo apt install -y libopenblas-dev liblapack-dev gfortran

# Install X11 libraries for display capabilities in WSL
sudo apt install -y python3-tk xorg-dev
```

These system packages provide the foundation for compiling scientific Python packages and enable graphical output in the WSL environment.

## Step 3: Create Co-Simulation Environment

Create a dedicated conda environment for co-simulation work:

```bash
# Create new environment with Python 3.10
mamba create -n cosim python=3.10

# Activate the environment
mamba activate cosim
```

Verify activation by checking that the terminal prompt now displays `(cosim)` at the beginning. This isolated environment will contain all co-simulation dependencies without affecting other projects.

## Step 4: Scientific Computing Stack Installation

Install the C++ runtime to avoid bizzare errors like "undefined symbol":

```bash
mamba install gcc_linux-64 gxx_linux-64 libstdcxx-ng libgcc-ng -c conda-forge
```

Install the foundational scientific computing packages using mamba:

```bash
# Install core scientific packages via conda-forge
mamba install numpy scipy matplotlib pandas

# Install Jupyter ecosystem for interactive development
mamba install jupyter jupyterlab

# Install additional analysis and visualization tools
mamba install networkx plotly seaborn

# Confirm installation
python -c "import numpy, scipy, matplotlib; print('Scientific stack installed successfully')"
```

## Step 5: HELICS Installation

HELICS serves as the co-simulation coordination platform. Install using pip as it provides the most recent version:

```bash
# Install HELICS with CLI extensions
python -m pip install 'helics[cli]'

# Verify installation
python -c "import helics as h; print(f'HELICS version: {h.helicsGetVersion()}')"
```

The installation should complete without errors and display the HELICS version (expected: 3.6.1 or later).

## Step 6: ANDES Installation

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

## Step 7: OpenDSS Installation

Install OpenDSSDirect.py for distribution system simulation:

```bash
# Install with full feature set
pip install opendssdirect.py[all]

# Verify installation
python -c "import opendssdirect as dss; print('OpenDSS installation verified')"
```

Note that OpenDSSDirect.py includes its own OpenDSS engine, eliminating the need for separate OpenDSS installation.

## Step 8: Display Configuration for WSL

Configure graphics display capabilities for WSL environments.

### For Windows 11 with WSLg

Windows 11 includes WSLg (WSL GUI) support by default. Test the configuration:

```bash
# Test matplotlib display capability
python -c "
import matplotlib.pyplot as plt
plt.figure()
plt.plot([1, 2, 3, 4])
plt.title('Display Test')
plt.savefig('display_test.png')
print('Graphics test completed - check for display_test.png')
"
```

### For Windows 10 or Display Issues

Configure X11 forwarding if WSLg is unavailable:

```bash
# Add display configuration to shell profile
echo 'export DISPLAY=$(grep -oP "(?<=nameserver ).+" /etc/resolv.conf):0.0' >> ~/.bashrc
source ~/.bashrc

# Test display functionality
python -c "
import matplotlib
matplotlib.use('Agg')  # Use file output backend
import matplotlib.pyplot as plt
plt.plot([1, 2, 3])
plt.savefig('test_plot.png')
print('Plot saved to test_plot.png')
"
```

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

**Issue**: Graphics not displaying in WSL
**Solution**: Configure matplotlib backend:
```python
import matplotlib
matplotlib.use('Agg')  # Use file output instead of display
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

**Cause**: This error occurs due to C++ ABI incompatibility between the HELICS library (compiled with older GCC) and the conda environment's newer libstdc++. Jupyter's library loading order differs from standalone Python.

**Solutions**:

#### Solution 1: Custom Jupyter Kernel (Recommended)

Create a custom kernel that preloads the correct libraries:

```bash
# Create kernel directory
mkdir -p ~/.local/share/jupyter/kernels/cosim-helics

# Create wrapper script
cat > ~/.local/share/jupyter/kernels/cosim-helics/python_wrapper.sh << 'EOF'
#!/bin/bash
# Set proper library paths for HELICS
export LD_LIBRARY_PATH="/home/$USER/mambaforge/envs/cosim/lib:/home/$USER/mambaforge/envs/cosim/lib64:$LD_LIBRARY_PATH"
export LD_PRELOAD="/home/$USER/mambaforge/envs/cosim/lib/libstdc++.so.6:$LD_PRELOAD"
exec "/home/$USER/mambaforge/envs/cosim/bin/python" "$@"
EOF

# Make wrapper executable
chmod +x ~/.local/share/jupyter/kernels/cosim-helics/python_wrapper.sh

# Create kernel.json
cat > ~/.local/share/jupyter/kernels/cosim-helics/kernel.json << 'EOF'
{
  "argv": [
    "/home/$USER/.local/share/jupyter/kernels/cosim-helics/python_wrapper.sh",
    "-m", "ipykernel_launcher",
    "-f", "{connection_file}"
  ],
  "display_name": "CoSim (HELICS Fixed)",
  "language": "python"
}
EOF

# Replace $USER with actual username in files
sed -i "s/\$USER/$USER/g" ~/.local/share/jupyter/kernels/cosim-helics/python_wrapper.sh
sed -i "s/\$USER/$USER/g" ~/.local/share/jupyter/kernels/cosim-helics/kernel.json
```

Then restart Jupyter Lab and select "CoSim (HELICS Fixed)" as the kernel.

#### Solution 2: Jupyter Startup Script

Create a startup script that sets the environment before launching Jupyter:

```bash
cat > ~/start_jupyter_cosim.sh << 'EOF'
#!/bin/bash
# Start Jupyter Lab with proper environment for HELICS

# Activate conda environment
source ~/mambaforge/etc/profile.d/conda.sh
conda activate cosim

# Set library paths
export LD_LIBRARY_PATH="$CONDA_PREFIX/lib:$CONDA_PREFIX/lib64:$LD_LIBRARY_PATH"
export LD_PRELOAD="$CONDA_PREFIX/lib/libstdc++.so.6:$LD_PRELOAD"

# Start Jupyter Lab
jupyter lab "$@"
EOF

chmod +x ~/start_jupyter_cosim.sh
```

Use with: `~/start_jupyter_cosim.sh`

#### Solution 3: Environment-Specific Fix

If using the `pct` environment instead of `cosim`, adjust the paths accordingly in the above solutions.

**Verification**: After applying a solution, test HELICS import in a Jupyter notebook:
```python
import helics as h
print(f"HELICS version: {h.helicsGetVersion()}")
```

## Environment Management

### Daily Activation

Create a convenience script for environment activation:

```bash
cat > ~/activate_cosim.sh << 'EOF'
#!/bin/bash
echo "Activating co-simulation environment..."
mamba activate cosim
echo "Environment activated. Current packages:"
mamba list | grep -E "(helics|andes|opendssdirect)"
echo
echo "Ready for co-simulation development."
EOF

chmod +x ~/activate_cosim.sh
```

Execute with: `source ~/activate_cosim.sh`

### Package Updates

Maintain current package versions:

```bash
# Update specific packages
pip install --upgrade helics andes opendssdirect.py

# Update conda packages
mamba update --all

# Check for outdated pip packages
pip list --outdated
```

### Environment Export and Sharing

Export the environment configuration for reproducibility:

```bash
# Export complete environment
mamba env export > cosim_environment.yml

# Export pip-only requirements
pip freeze > pip_requirements.txt
```

Recreate environment from exported configuration:

```bash
mamba env create -f cosim_environment.yml
```

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