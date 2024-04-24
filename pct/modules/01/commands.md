# Using the Command Line

## Landing in the Linux Shell

When you open a new Linux terminal, you will see a prompt like

```bash
User@Machine:~$
```

In this prompt, `User` is the username, `Machine` is the machine name, and `~`
stands for the home directory, which is the current working directory. The colon
`:` is a separator between the machine name and the working directory.

The prompt character is `$` for a regular user and `#` for a superuser.

## Navigating the File System

To navigate the file system in the shell, you will need to master a few commands.

- `cd`: Change directory
- `ls`: List files and directories
- `pwd`: Print working directory

### Change Directory

The `cd` command is used to change the current working directory. When a single
argument is passed, namely, the path to the directory, the current working
directory is changed to the specified directory.

```bash
User@Machine:~$ cd /tmp
User@Machine:/tmp$ cd ..
User@Machine:/$ cd
User@Machine:~$
```

The first command
`cd /tmp` specifies an absolute path `/tmp`, so the working directory is changed
accordingly as you see in the second command.

The second command `cd ..` changes the directory to the parent directory. `..` is
a relative path to the parent directory. As a result, the directory changed from
`/tmp` to `/`. In Linux, `/` is known as the root directory. Every directory has
an absolute path that starts from the root directory.

The third command `cd` without any argument changes the directory to the home
directory. The home directory is the directory where the user is located. The
directory change can be confirmed by the `pwd` command.

```{admonition} Case-Sensitive
:class: tip

Linux is case sensitive because UNIX is. This might feel a bit confusing when
you are used to Windows. It is case sensitive, meaning that all the *command* and
*file names* are case sensitive.
```

### Print Working Directory

The `pwd` command prints the absolute path of the current directory.

```bash
User@Machine:~$ pwd
/home/User
```

It is very common to use relative paths when changing directories. For example,

```bash
User@Machine:/home$ cd User
User@Machine:~$ pwd
/home/User
```

confirms that changing to the folder `User` relative to the current directory
`/home` is successful.

### List Files and Directories

The `ls` command is used to list the files and directories in the current
directory.

`ls` can accept a path to a directory as an argument. It will then list the
items in the specified directory.

`ls` can take arguments. A few commonly used arguments are

- `-a`: Show all files and directories, including hidden ones
- `-l`: Show detailed information about the files and directories
- `-t`: Sort the files and directories by time
- `-r`: Reverse the order of the files and directories

These options can be combined. For example, `ls -lrt` is equivalent to
`ls -l -r -t`, which will list the files and directories in the current
directory in reverse order of time. The combination is agnostic to the option
order.

```{admonition} Hidden files and directories
:class: tip

Hidden files and directories are named to start with a dot `.`.
They are not displayed by `ls` but are shown by `ls -a`.
```

### Make a Directory

The `mkdir` command is used to make a directory. It can take a path to the
directory as an argument.

### Remove

Two commands are used to remove files and directories. `rm` is used to remove
files or directories.

`rmdir` is used to remove empty directories.

Create a directory and a file in it.

```bash
User@Machine:~$ mkdir test
User@Machine:~$ ls
test
User@Machine:~$ touch test/file.txt
User@Machine:~$ ls test
file.txt
```

Since the directory `test` is not empty, `rmdir` will not work.
```bash
User@Machine:~$ rmdir test
rmdir: test: Directory not empty
```

One can remove the directory `test` with `rm -r test`. The option `-r` stands
for recursive, meaning that the folder and everything (files and subfolders)
inside will be removed.

```bash
User@Machine:~$ rm -r test
User@Machine:~$ ls
```

```{admonition} No Recycle Bin on Linux
:class: caution

Linux bash does not have a built-in recycle bin.
Files deleted with `rm` are gone forever.

If unsure, use `mv` to rename the file or move it to a temporary location.
```

### Copy and Move

The commands for copy and move are `cp` and `mv`.

The format for calling both commands is `command SOURCE DESTINATION`.

The example below makes a copy of `file.txt` to `file2.txt`.
```bash
User@Machine:~$ cp file.txt file2.txt
User@Machine:~$ ls
file.txt  file2.txt
```

The example below moves `file2.txt` to the directory `test`.
```bash
User@Machine:~$ mv file2.txt test
User@Machine:~$ ls test
file2.txt
User@Machine:~$ ls
file.txt
```

## Text-based editors


## Manual


```{bibliography}
:filter: docname in docnames
```