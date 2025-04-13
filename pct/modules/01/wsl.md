
# Windows Subsystem for Linux

## Why Linux?

You may have heard of Linux from news articles. You may know that Linux
powers many devices, from an Android smart phone to supercomputers to
Steam Deck and Tesla. Linux is free and open source software, and it is
the foundation of many operating systems.

You may not have used Linux before, and that is okay! Most of the work a
power engineering researcher does is in Windows. Many of the power
domain software are exclusively available on Windows.

But why do we want to use Linux? Many data analytics and machine
learning libraries are developed primarily for Linux environments, which
can make them easier to install and maintain
{cite}`vaughan-nicholsLinuxOpensourceRules`. Additionally, certain
specialized workflows, particularly those involving GPU computation, may
benefit from Linux's native support for these technologies
{cite}`horovitzAccelerateAIDevelopment`.

You probably have heard that Linux is difficult to use. In the early
days, command line was the only usable interface. Well, that is still
true for many use cases, but you only need a small set of skills to
productive with Linux.

So let's dive in.

## Windows Subsystem for Linux (WSL)

Apparently, we do not want to buy a new computer just for Linux if you
have one that runs Windows. Maybe you have heard of Virtual Machines
(VM). VMs are programs that emulate a computer inside your operating
system, so that you can run another operating system there. The issue of
VMs is that they are slow; it takes too many resources to emulate
everything of a computer. We will resort to a newer technology called
Windows Subsystem for Linux (WSL).

WSL is a feature of Windows that allows one to create a Linux
environment within Windows. WSL eliminates the need for a virtual
machine or dual-boot to use Linux. WSL was originally created to meet
the demand from users who want to use Linux BASH productivity tools in
Windows {cite}`why-was-wsl-created`.

:::{tip} How is WSL different from a virtual machine?

VM software, such as VirtualBox or VMware, emulates a physical computer
from the ground up on the host operating system. WSL is different
because it uses a compatibility layer that is transparent to the user
when running Linux applications. WSL is thus more lightweight and faster
than a VM. 
:::

## Installing WSL

You can install WSL on Windows 10 or later. On Windows 11 or later, WSL
can support graphical applications that are native to Linux.

If you don't have a preference on the Linux distribution, you may go
with Ubuntu.

Follow the video below to install WSL and Ubuntu.

<iframe width="560" height="315" src="https://www.youtube.com/embed/eId6K8d0v6o?si=gnCRURtNuQKkwXrq" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen>

</iframe>

## Getting to Know WSL

There are a few different ways to launch WSL. On Windows 11, you can use
Windows Terminal to launch WSL. On Windows 11 or 10, you can open
Command Prompt or PowerShell, type in `wsl` and press Enter. This will
open a Linux-based shell.

The first thing is to distinguish the Linux-based shell from the Windows
Command Prompt (`cmd`) or PowerShell (`powershell`). Distinguishing the
two will ensure that you run the commands in the right place. It can be
confusing in the beginning. The Command Prompt and PowerShell are for
running Windows-based command-line programs. One of the programs is
`wsl.exe`, which opens up the Linux shell where Linux programs can run.
One cannot run a program compiled for Linux on Windows, or vice versa,
without using a compatibility layer like WSL or WINE {cite}`wine`.

The screenshots below show the Windows CMD, Windows PowerShell, and a
Ubuntu Bash Shell. If the path to the left of the prompt reads like
`C:` (or another disk name but contains `:`), this indicates a path on
Windows so you are in a Windows shell.

:::{note} TODO: Add a clean screenshot of the shells. 
:::

## Files in WSL

The files in WSL are stored in the Windows file system. In "My
Computer", you will see a new drive, typically `\\wsl$`. This drive is
convenient for accessing your WSL files from Windows.

:::{bibliography} :filter: docname in docnames 
:::

:::{admonition} Quizzes

1.  Why do we want to use Linux?
2.  What does WSL stand for?
3.  How is WSL different from a virtual machine?
4.  How do you launch WSL?
5.  How do you distinguish between Windows and Linux files? 
:::

