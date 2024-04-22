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

It is very common to use relative paths. For example, 

```bash
User@Machine:/home$ cd User
User@Machine:~$ pwd
/home/User
```

confirms that changing to the folder `User` relative to the current directory
`/home` is successful.


## Text-based editors



```{bibliography}
:filter: docname in docnames
```