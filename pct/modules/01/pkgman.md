# Software and Package Management

## Python environment

Python is a popular programming language widely used for scientific computing.
It is known for its simplicity and readability. Python has a rich ecosystem of
libraries and tools that make it a powerful language for data analysis, machine
learning, and web development.

An important aspects of software development is the management of
dependencies. There is always such need because one of your projects can depend
on a specific version of a package. You will create multiple so-called
"environments", such that a specific version of packages is installed in a specific
environment.

Python provides a package manager called `pip` that makes it easy
to install and manage dependencies. `pip` works well for small projects but sees
difficulties when managing complex projects with binary (compiled library)
dependencies. Binary dependencies exist because they are compiled from source code
for specific operating systems and hardware architectures.

To solve the problem of binary dependencies, we can use a package manager called
`conda`. `conda` is a package manager that is more robust and handles binary
dependencies better than `pip`. 

### Anaconda, conda, and miniconda
Here is some background. 

1. Anaconda Inc. is a company that develops the Anaconda Distribution ("Anaconda" in short).
It is a collection of packages for Python and R.

2. Central to the Anaconda Distribution is the `conda` tool for package management.

3. Miniconda is a free and slim version of Anaconda. It is a bootstrap (self-starting) version of
Anaconda that provides only `conda`, Python, and a small number of packages like `pip`.

### conda-forge
To distribute packages on Anaconda, one needs to create an account and publish the 
package under that account (called "channel"). It is sometimes difficult locate the channel 
and the correct version of the package. Therefore, `conda-forge` is a single, community-managed
channel that contains all the packages that are available for `conda`.

### mamba, and mini-forge

`conda` is great but not perfect. Since `conda` is written in Python, its speed is a bottleneck when
resolving many dependencies with multiple versions. `mamba`, as the name suggests, is a fast, concurrent
package manager that is built on top of `conda` and `pip`. It is a drop-in replacement for `conda`
and is much faster.

In the following, we may use `mamba` and `conda` interchangeably as they are 
drop-in replacements of each other. If you want speed as much as I do, use `mamba`.

### pip and conda

This section is useful if you already know `pip`.

`conda` is not entirely an alternative to `pip`. Many packages can be installed
by either of them. Packages with significant binary dependencies (such
as NVIDIA CUDA) can be installed by `conda` but not by `pip`.
Some (probably less frequently used) packages can be installed
by `pip` but not by `conda`, because the authors haven't published the package
to `conda`.

 `conda` uses different package registries and
handle binary dependencies differently under the hood.

## Using mamba to manage environments

My recommended practice is to use `conda`/`mamba` to manage environments. This
is helpful on Windows, Linux (including WSL), and macOS to avoid headaches down
the road.

### Installation
As an example, we will install `miniforge`, which provides `mamba` and `conda`.
`Miniforge` can be found at https://github.com/conda-forge/miniforge.

To install in WSL, follow the installation instruction at
https://github.com/conda-forge/miniforge. 

Once installed, you will need to restart your shell by closing and reopening
your WSL terminal. You will notice a change in your shell prompt.

```bash 
(base) User@Host:~$
```

The `(base)` indicates that you are now operating in the `base` environment set
by conda. Operating in a specific environment will let you gain access to the
packages in that environment, on top of system-wide packages.

### Creating environments

We will explain environment by example. Let's create a new environment called
`pct` and install `python=3.12` in it.

```bash
(base) User@Host:~$ mamba create -n pct python=3.12
```

The `-n` flag tells `mamba` to create a new environment called `pct`. The `python=3.12`
specifies that we want to install Python 3.12 in the new environment. You can
specify Python packages alongside `python=3.12`. The output may look like

```bash
                  __    __    __    __
                 /  \  /  \  /  \  /  \
                /    \/    \/    \/    \
███████████████/  /██/  /██/  /██/  /████████████████████████
              /  / \   / \   / \   / \  \____
             /  /   \_/   \_/   \_/   \    o \__,
            / _/                       \_____/  `
            |/
        ███╗   ███╗ █████╗ ███╗   ███╗██████╗  █████╗
        ████╗ ████║██╔══██╗████╗ ████║██╔══██╗██╔══██╗
        ██╔████╔██║███████║██╔████╔██║██████╔╝███████║
        ██║╚██╔╝██║██╔══██║██║╚██╔╝██║██╔══██╗██╔══██║
        ██║ ╚═╝ ██║██║  ██║██║ ╚═╝ ██║██████╔╝██║  ██║
        ╚═╝     ╚═╝╚═╝  ╚═╝╚═╝     ╚═╝╚═════╝ ╚═╝  ╚═╝

        mamba (0.22.1) supported by @QuantStack

        GitHub:  https://github.com/mamba-org/mamba
        Twitter: https://twitter.com/QuantStack

█████████████████████████████████████████████████████████████


Looking for: ['python=3.12']

conda-forge/linux-64                                        Using cache
conda-forge/noarch                                          Using cache
Transaction

  Prefix: /home/User/mambaforge/envs/pct

  Updating specs:

   - python=3.12


  Package              Version  Build               Channel                    Size
─────────────────────────────────────────────────────────────────────────────────────
  Install:
─────────────────────────────────────────────────────────────────────────────────────

  + _libgcc_mutex          0.1  conda_forge         conda-forge/linux-64     Cached
  + _openmp_mutex          4.5  2_gnu               conda-forge/linux-64     Cached
  + bzip2                1.0.8  hd590300_5          conda-forge/linux-64      254kB
  + ca-certificates   2024.2.2  hbcca054_0          conda-forge/linux-64     Cached
  + ld_impl_linux-64      2.40  h55db66e_0          conda-forge/linux-64      713kB
  + libexpat             2.6.2  h59595ed_0          conda-forge/linux-64       74kB
  + libffi               3.4.2  h7f98852_5          conda-forge/linux-64     Cached
  + libgcc-ng           13.2.0  h77fa898_7          conda-forge/linux-64      776kB
  + libgomp             13.2.0  h77fa898_7          conda-forge/linux-64      422kB
  + libnsl               2.0.1  hd590300_0          conda-forge/linux-64       33kB
  + libsqlite           3.45.3  h2797004_0          conda-forge/linux-64     Cached
  + libuuid             2.38.1  h0b41bf4_0          conda-forge/linux-64       34kB
  + libxcrypt           4.4.36  hd590300_1          conda-forge/linux-64      100kB
  + libzlib             1.2.13  hd590300_5          conda-forge/linux-64     Cached
  + ncurses                6.5  h59595ed_0          conda-forge/linux-64      887kB
  + openssl              3.3.0  h4ab18f5_3          conda-forge/linux-64        3MB
  + pip                   24.0  pyhd8ed1ab_0        conda-forge/noarch          1MB
  + python              3.12.3  hab00c5b_0_cpython  conda-forge/linux-64       32MB
  + readline               8.2  h8228510_1          conda-forge/linux-64     Cached
  + setuptools          70.0.0  pyhd8ed1ab_0        conda-forge/noarch        483kB
  + tk                  8.6.13  noxft_h4845f30_101  conda-forge/linux-64        3MB
  + tzdata               2024a  h0c530f3_0          conda-forge/noarch        120kB
  + wheel               0.43.0  pyhd8ed1ab_1        conda-forge/noarch         58kB
  + xz                   5.2.6  h166bdaf_0          conda-forge/linux-64     Cached

  Summary:

  Install: 24 packages

  Total download: 44MB

─────────────────────────────────────────────────────────────────────────────────────

Confirm changes: [Y/n] y
libgomp                                            422.3kB @   1.6MB/s  0.3s
libxcrypt                                          100.4kB @ 284.9kB/s  0.4s
ld_impl_linux-64                                   713.3kB @   1.9MB/s  0.4s
wheel                                               58.0kB @ 138.6kB/s  0.1s
libgcc-ng                                          775.8kB @   1.7MB/s  0.4s
bzip2                                              254.2kB @ 533.3kB/s  0.1s
libnsl                                              33.4kB @  64.3kB/s  0.1s
tzdata                                             119.8kB @ 207.6kB/s  0.1s
ncurses                                            887.5kB @   1.5MB/s  0.1s
openssl                                              2.9MB @   4.6MB/s  0.6s
libuuid                                             33.6kB @  52.6kB/s  0.1s
tk                                                   3.3MB @   5.1MB/s  0.4s
setuptools                                         483.0kB @ 668.8kB/s  0.1s
pip                                                  1.4MB @   1.8MB/s  0.2s
libexpat                                            73.7kB @  76.7kB/s  0.3s
python                                              32.0MB @  19.8MB/s  1.2s
Preparing transaction: done
Verifying transaction: done
Executing transaction: done

To activate this environment, use

     $ mamba activate pct

To deactivate an active environment, use

     $ mamba deactivate
```

The end of the output suggests that you have created but not yet activated the
environment. Before activating the new environment, let's check which Python
interpreter can be found in the current env:

```bash
(base) User@Host:~$ which python
/home/User/mambaforge/bin/python
(base) User@Host:~$ python
Python 3.9.6 | packaged by conda-forge | (default, Jul 11 2021, 03:39:48)
[GCC 9.3.0] on linux
Type "help", "copyright", "credits" or "license" for more information.
>>> exit()
(base) User@Host:~$          
```
You can tell that the Python interpreter in `base` is Python 3.9 on my machine.
It may differ on yours.

Next, let's activate the new environment:

```bash
(base) User@Host:~$ mamba activate pct
(pct) User@Host:~$ which python
/home/User/mambaforge/envs/pct/bin/python
(pct) User@Host:~$ python
Python 3.12.3 | packaged by conda-forge | (main, Apr 15 2024, 18:38:13) [GCC 12.3.0] on linux
Type "help", "copyright", "credits" or "license" for more information.
>>> exit()
(base) User@Host:~$          
```

You can tell the `python` command now points to the Python in the `pct`
environment. The preamble of the Python interpreter indicates that you are using
the installed 3.12 version.

```{admonition} Exercise
1. Follow the same steps to create a new environment called `pct` and install Python 3.12 in it.

2. Activate the environment, and check the Python version.

3. Deactivate the environment, and check the Python version again.
```

### When to use `conda` and `pip`

It is a good practice to **avoid** installing packages to the `base` environment.
The `base` environment is to provide the core libraries and dependencies for a
functional `conda` installation. Installations to `base` may lead to unexpected
behavior.

Instead, create a new environment for each project. Just remember to activate
the environment before installing packages or running scripts.

We mentioned that a Python package may be installed by `conda` or `pip`. The
recommended practice is:

- If a package is available for `conda`, install it via `conda`. This will
  satisfy a more complete set of dependencies.
- If a package is not available for `conda`, install it via `pip`.

### Installation with `conda`

There are a few commonly used commands for `mamba` besides `activate` and
`deactivate`: 

- `mamba install`: Install a package.
- `mamba update`: Update a package.
- `mamba remove`: Remove a package.
- `mamba list`: List installed packages in the current environment.

```{admonition} Exercise
1. Activate the `pct` environment.
2. Install `jupyter` via `mamba` using `mamba install jupyter`. 
   You will be prompted to confirm the installation. Type `y` and press `Enter`.
   You can skip the confirmation with `mamba install jupyter --yes`.
3. Run `jupyter notebook` to start the Jupyter notebook. Follow the link to open
   the notebook in your web browser.
4. Close the notebook program from the terminal by using `Ctrl-C` 
   (holding down Ctrl and press C).
5. Deactivate the `pct` environment to return to `base`.
6. Run `jupyter notebook` again. You should see an error message, indicating that
   `jupyter` is not installed. Why?
```

Oftentimes, you will use `conda search` to search for packages. For example,
`mamba search jupyter` will search for `jupyter` in the `conda-forge` channel,
which the default channel for mamba. The search result may include multiple versions
of `jupyter`. 

```{admonition} Specifying the version for packages
You can install a specific version of `jupyter` by specifying the
version number, such as `mamba install jupyter=1.0.0`.

If this is an installed package, the requested version may dependent packages to
be downgraded or upgrades. That might occasionally lead to unresolvable conflicts.
```

``` {admonition} Exercise with mamba list
It is useful to check what packages are installed in the current env.
1. Activate the `pct` environment.
2. Run `mamba list`. You will see a rather long list of packages, although we
   only installed `jupyter`. Other packages are the dependencies of Jupyter.
```

### Installation with `pip`


(Talk about the `mamba list ` output that includes pypi packages)


## System-wide packages


`development tools`


Test

```{bibliography}
:filter: docname in docnames
```