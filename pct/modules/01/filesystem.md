# File System Hierarchy

## Introduction

The Linux file system has a hierarchical structure. Unlike Windows, which uses
letters (C:, D:, etc.) to represent different drives, Linux uses a single
directory `/` as the root of the entire file system. All files and directories
are stored, logically, in the `/` directory.

## Absolute and Relative Paths

An absolute path is a path that starts from the root directory `/`. For example,
`/home/user1` is an absolute path. A relative path is a path that starts from
the current directory. For example, `home/user1` is path relative to the working
directory.

## Common Directories

The File System Hierarchy Standard (FHS) defines the directory structure and
directory contents in Unix-like operating systems. The FHS is maintained by the
Linux Foundation.

The following are some common directories in the Linux file system:

- `/home`: This directory contains the home directories of all users. That
  includes your home directory.
- `/root`: This is the home directory of the root user. It is only accessible by
  the superuser.
- `/bin`: This directory contains essential system binaries. Common commands
  like `ls`, `cp`, and `mv` are stored here.
- `/sbin`: This directory contains essential system binaries that are used by
   the superuser.
- `/usr`: This directory contains user binaries, libraries, and documentation.
  This is not to be confused with the `/home` directory.
- `/etc`: This directory contains system-wide configuration files.
- `/mnt`: Mount point for mounting a filesystem temporarily.

## Permissions

Linux has a robust permission system that controls who can access files and
directories.

When you list files with `ls -l`, you will see the details of files and
directories. For example,

```bash
User@Machine:~$ ls -la
drwxrwxr-x  3 User staff 4096 Feb 16 22:04 .github
```

shows the info of the `.github` folder, which is owned by the user `User` and
the group `staff`. `3` is the number of links to the directory. `4096` is the
size of the directory itself in bytes.

`drwxrwxr-x` is the permission string:

- The first character indicates the type of the file. `d` for directory, `-` for
  a regular file.
- The next three characters are the *owner's permissions*. The owner can read,
  write, and execute the file.
- The next three characters are the *group's permissions*. The group can read,
  write, and execute the file.
- The last three characters are the *other users' permissions*. They can read,
  and execute the file but cannot write.

The permission string is also represented in octal format with three in a group.
`rwxrwxr-x` is `775` in octal.

### Changing Permissions

The `chmod` command is used to change the permissions (mode bits) of a file or
directory. The format is `chmod MODES FILES`. For example,

```bash
User@Machine:~$ chmod 755 file.txt
```
removes the write permission for the group and others.

Permissions can be changed recursively with the `-R` flag. For example,

```bash
User@Machine:~$ chmod -R 755 folder
```
changes the permissions of the `folder` and all its contents.


```{bibliography}
:filter: docname in docnames
```
