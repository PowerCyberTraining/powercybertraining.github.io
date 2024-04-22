# Windows Subsystem for Linux

## Introduction

Windows Subsystem for Linux (WSL) is a feature of Windows that allows one to
create a Linux environment within Windows. WSL eliminates the need for a
virtual machine or dual-boot to use Linux. WSL was originally created to meet the
demand from users who want to use Linux BASH productivity tools in Windows
{cite}`why-was-wsl-created`.


`````{admonition} How is WSL different from a virtual machine?
:class: tip
You may have used a virtual machine to run Linux on Windows, such as VirtualBox
or VMware. These virtual machines software emulates a physical computer from the
ground up on the host operating system. WSL is different by using a
compatibility layer that is transparent to the user to run Linux applications.
`````

## Installing WSL

You can install WSL on Windows 10 or later. On Windows 11 or later, WSL can support
graphical applications that are native to Linux.

If you don't have a preference on the Linux distribution, you may go with Ubuntu.

<iframe width="560" height="315" src="https://www.youtube.com/embed/eId6K8d0v6o?si=gnCRURtNuQKkwXrq" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

## Getting to Know WSL

There are a few different ways to launch WSL. On Windows 11, you can use Windows
Terminal to launch WSL. On Windows 11 or 10, you can open Command Prompt or
PowerShell, type in `wsl` and press Enter. This will open a Linux-based shell.

The first thing is to distinguish the Linux-based shell from the Windows Command
Prompt (`cmd`) or PowerShell (`powershell`). Distinguishing the two will ensure
that you run the commands in the right place. It can be confusing in the
beginning. The Command Prompt and PowerShell are for running Windows-based
command-line programs. One of the programs is `wsl.exe`, which opens up the
Linux shell where Linux programs can run. One cannot run a program compiled for
Linux on Windows, or vice versa, without using a compatibility layer like WSL or
WINE {cite}`wine`. 

The screenshots below show the Windows CMD, Windows PowerShell, and a Ubuntu
Bash Shell. If the path to the left of the prompt reads like `C:\` (or another
disk name but contains `:\`), this indicates a path on Windows so you are in a
Windows shell.

```{note}
TODO: Add a clean screenshot of the shells.
```


```{bibliography}
:filter: docname in docnames
```