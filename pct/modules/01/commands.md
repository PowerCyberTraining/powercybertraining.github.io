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

## Basic Commands

To navigate the file system in the shell, you will most likely use the following
commands.

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

To list files that match a pattern, one can use the wildcard `*`. For example,

```bash
User@Machine:~$ ls f*.txt
file.txt
```

This command lists all files that start with `f` and end with `.txt`.

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

### View File Content

The `cat` command is used to view the content of a file.

```bash
User@Machine:~$ cat file.txt
Hello, World!
```

### Find Files

The `find` command is used to search for files in a directory.

```bash
User@Machine:~$ find . -iname "file.txt"
./file.txt
```

where `-iname` is the combination of `-i` for case-insensitive search and
`-name` for specifying the file name.

### Search in Files

`grep` is used to search for a pattern in a plain-text file.

```bash
User@Machine:~$ grep -i "hello" file.txt
Hello, World!
```

You can specify a path to the file or use a wildcard to search in multiple
files.

```bash
User@Machine:~$ grep -iR "hello" .
Hello, World!
```

It searches for the pattern `hello` in all files in the current directory (`.`),
recursively (`-R`).

### Manual Pages

Most commands support `--help` or `-h` to show a brief description of the
command. The full usage and options are documented in the manual pages. `man
COMMAND` shows the manual page for the command.

```bash
man rmdir
```

will open the manual page for the `rmdir` command. When browsing, press `q` to
exit, and use the arrow keys to scroll, and use `/` to search.



## Advanced Commands


### Echo / Display Text

The `echo` command is used to display a line of text.

```bash
User@Machine:~$ echo "Hello, World!"
Hello, World!
```

The `echo` command is powerful when combined with other commands, such as the
redirection operator `>`.

### Redirection

The redirection operator `>` redirects the output of a shell command to a file.

```bash
User@Machine:~$ echo "Hello, World!" > file.txt
User@Machine:~$ cat file.txt
Hello, World!
```

There are two types of redirection operators. `>` overwrites the file, while
`>>` appends the output to the file.

```{admonition} Further Reading: Linux File Descriptors

In Linux, everything is a file. That includes the standard input, output, and
standard error. They correspond to file descriptors 0, 1, and 2, respectively.

- `>` redirects the standard output (file descriptor 1) to a file.
- `2>` redirects the standard error (file descriptor 2) to a file.
- `&>` redirects both the standard output and standard error to a file.

```

### Environment Variables

Environment variables are used to store information that can be used by
programs. They are set in the shell and are inherited by child processes. The
`env` command is used to list the environment variables. You will likely see a
long output with many variables.

The best known environment variable is `PATH`. It is a colon-separated list of
directories where the shell looks for executable files. When you type a command,
the shell looks for the command in the directories listed in the `PATH`
variable. This is how you can run a command without specifying the full path.

To find out where a command is located, you can use the `which` command.

```bash
User@Machine:~$ which ls
/usr/bin/ls
```

This command shows that the `ls` command is located at `/usr/bin/ls`.

### Permissions

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

### Changing Ownership

There may be times you run into permission issues. This often happens when you
use the `root` user (superuser) to run a command. For example, you probably have
used `sudo` to install a package.

If you accidentally run a command as the superuser, all the files and
directories created by the command will be owned by the superuser. A regular
issue will then not be able to modify or remove the files.

The `chown` command is used to change the ownership of a file or directory. The
format is `chown OWNER:GROUP FILES`. For example,

```bash
User@Machine:~$ chown User:staff file.txt
```

changes the ownership of `file.txt` to the `User` user and the `staff` group.

If you need to change the ownership from `root` to yourself, you will need to
use `sudo`, because only the superuser can relinquish its ownership.

```bash
User@Machine:~$ sudo chown User:staff file.txt
```

There are options like `-R` to apply the change recursively.

```{admonition} Caution with sudo
:class: caution

Always be careful when using `sudo`. It can easily mess up the permissions.
```


### Pipes

Pipes `|` are used to connect the output of one command to the input of another
command. A basic idea of UNIX is that you can chain commands together to do
complex tasks. Pipes are what makes the shell powerful.

For example, `ls -l` lists the files and folders, By inspection of
`ls -l`, you can tell that the first line is the heading that indicates the
number of disk blocks used. The rest of the lines are the files and folders.

The command `wc -l` counts the number of lines. You can combine them to count
the number of files and folders:

```bash
User@Machine:~$ ls -l | wc -l
25
```

The output of `ls -l` is piped to `wc -l`. The output is 25, so excluding the
header, there are 24 files and folders.

## Text-based editors

Occasionally, you may need to edit a file in the shell. There are several
editors available. The most common ones are `nano`, `vim`, and `emacs`.

### Nano

The `nano` editor is a simple text editor that is available on most Linux
distributions. It is easy to use: to edit a file, do `nano FILENAME`. When
`nano` opens, just type your text.

To exit `nano`, press `Ctrl` + `X`. If you have unsaved changes, `nano` will ask
you confirm.

### Vim
`vim` is a powerful text editor with a steep learning curve. As an evidence, the
question
[how do I exit
`vim`](https://stackoverflow.com/questions/11828270/how-do-i-exit-vim) on StackOverflow
has over 3 million views.


Vim has two modes, normal mode and insert mode. In normal mode, you can navigate
and execute commands. In insert mode, you can type text. You enter insert mode by
pressing `i`, and you exit back to normal mode by pressing `Esc`.

```{admonition} Exiting Vim
:class: tip

To exit `vim`, press `Esc` to ensure you are in the normal mode. Then type `:q`
```

To save a file, you can type `:w`. To save and exit, you can type `:wq`.

With the very basics, you will at least not stuck in `vim`. If interested, there
are plenty of materials to teach yourself.


```{bibliography}
:filter: docname in docnames
```
