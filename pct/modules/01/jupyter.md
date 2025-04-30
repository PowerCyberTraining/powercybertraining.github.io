
# Jupyter Notebook

## Why use Jupyter?

Jupyter is an open-source, web-based interface for interactive
computing. Jupyter Notebook is Jupyter's document format that can store
live code, equations, visualizations, and text. These documents can be
shared for reproducible research and published online. This book you are
reading is written in Jupyter Notebook.

Jupyter supports many programming languages, including Python, Julia and
R. Since the primary language of this training is Python, we will use
Jupyter for it.

## Install Jupyter

### Jupyter Notebook

If you have followed through the previous section, you should have
already installed Jupyter Notebook. If not, you can install it by

``` bash
# activate your conda environment

# install jupyter notebook
mamba install jupyter notebook
```

You can launch Jupyter Notebook by

``` bash
jupyter notebook
```

The command line will print a URL that you can open in your web browser
to access. If the web browser does not open automatically, you can hold
down Ctrl and click on the URL, or copy and paste the URL into your web
browser.

This is the classical Jupyter Notebook interface.

### JupyterLab

Jupyterlab is the modern web interface for Jupyter. It is more powerful
by allowing multiple notebooks to be edited in the same browser window.
You will find it much more convenient to use.

You can install JupyterLab by

``` bash
mamba install jupyterlab
```

You can launch JupyterLab by

``` bash
jupyter lab
```

## Tour of Jupyter Notebook and JupyterLab

The official Jupyter website contains two brief tours:

- [Jupyter Notebook
  Tour](https://jupyter.org/try-jupyter/notebooks/?path=notebooks/Intro.ipynb)
- [JupyterLab Tour](https://jupyter.org/try-jupyter/lab/index.html)

Please visit each of them. After the page loads, you will see a message
at the lower right corner, saying "Try the Notebook Tour" or "Try the
Welcome Tour.". Click "Start Now" to begin the tour.

## Shortcuts

Learning to use shortcuts can significantly increase your productivity!
Here are some shortcuts to start with:

1.  When you are editing a cell, press `esc` to exit edit mode.
2.  When you are NOT editing a cell, you can use arrow keys to move
    around. Alternatively, you can use `j` and `k` to move between
    cells. `j` and `k` reduces the travel distance of the hand compared
    to arrow keys.
3.  To edit a cell, move the focus there and press `Enter`.
4.  You can insert a cell using `b` (below) or `a` (above).
5.  You can delete a cell using `dd`.
6.  You can run a cell using `Shift+Enter`. This will run the cell and
    move the focus to the next cell. If this is the last cell, a new one
    will be inserted.
7.  Merge a cell with the cell below it using `Shift+M`.
8.  To split a cell into two, move the focus to the line where you want
    to split, then press `Ctrl+Shift+Minus(-)`. Think of that `-` as a
    separator.
9.  To change a cell from code to markdown, press `m`. To change it back
    to code, press `y`.

## Advanced Features

### Magic Commands

Magic commands are a special commands to make life easier.

Magic commands in Jupyter are special commands that start with `%` (line
magics) or `%%` (cell magics). They provide quick access to various
features and can significantly enhance your workflow. Here are some
commonly used magic commands:

### Line Magics (%)

1.  `%timeit`: Time the execution of a single line of code

    ``` python
    %timeit [1, 2, 3, 4, 5].sort()
    ```

2.  `%matplotlib inline`: Display matplotlib plots inline in the
    notebook

    ``` python
    %matplotlib inline
    import matplotlib.pyplot as plt
    plt.plot([1, 2, 3, 4])
    plt.show()
    ```

3.  `%who`: List all variables in the current namespace

    ``` python
    %who
    ```

4.  `%load`: Load code from an external file

    ``` python
    %load my_script.py
    ```

### Cell Magics (%%)

1.  `%%time`: Time the execution of an entire cell. This is useful when
    you want to understand the performance of a code block

    ``` python
    %%time
    import time
    for i in range(1000000):
        _ = i**2
    ```

2.  `%%writefile`: Write the contents of a cell to a file

    ``` python
    %%writefile example.py
    def hello():
        print("Hello, World!")
    ```

3.  `%%html`: Render the cell as HTML

    ``` html
    %%html
    <h1>This is a header</h1>
    <p>This is a paragraph.</p>
    ```

You can get a list of all available magic commands by running
`%lsmagic`. To get help on a specific magic command, you can use
`%magic_command?` (e.g., `%timeit?`).

Magic commands are a powerful feature of Jupyter that can help you write
more efficient and interactive notebooks. Experiment with different
magic commands to find the ones that best suit your workflow!

## Markdown and LaTeX

Jupyter supports Markdown for rich text formatting and LaTeX for
mathematical equations:

``` markdown
# Header 1
## Header 2
- List item 1
- List item 2

Inline equation: $E = mc^2$
Block equation:
$$
\frac{\partial f}{\partial x} = 2x
$$
```

## Exporting Notebooks

Jupyter notebooks can be exported to various formats. One can use the
menu "File" - "Save and Export Notebook As" to export the notebook from
the `.ipynb` format to others.

Notebooks can also be converted with commands:

``` bash
jupyter nbconvert --to pdf your_notebook.ipynb
jupyter nbconvert --to html your_notebook.ipynb
```

## Jupyterlab Extensions

In addition to the standard features, Jupyterlab can be extended by
using third-party extensions. These third-party extensions provide
features such as code formatting, integration with Google Drive, or
integration with GitHub.

Extensions can be installed by clicking on the "puzzle piece" icon. Upon
the first use, one will be warned about the risks of using third-party
extensions. After acknowledging the risks, one can use the search
feature to find extensions, or browse all of them.

There are some good extensions to begin with, but one may install them
as needed, becasue having to load many extension may slow the startup of
Jupyterlab and increase memory consumption on the client browser.

Try searching for "formatter" and installing
`jupyterlab-code-formatter`. When done, in a new notebook window, a
"format notebook" icon will appear. To use it, highlight the code to
reformat, and click on the formatter.

Other useful extensions to consider:

- jupyterlabcodetoc: for adding a table of contents, which helps
  navigate in a large but organized notebook
- jupyterlab-git: for git integration within Jupyterlab

## Themes

JupyterLab supports both light and dark themes just like your newer
phone and computer operating system. You can change the theme by going
to Settings \> Theme in the JupyterLab menu.

Using a dark theme can be easier on the eyes, especially when working in
low-light environments.

## Setting Password

You may have noticed that Jupyter generates a random session key each
time you start it. That looks like

    http://localhost:8888/lab?token=85f1ba706b2151a5d8a9c0b6be01b86db62854935798ab27

If you are using Jupyter on a local WSL, it may be helpful to use your
own password, so that you can head directly to the browser if the
automatic pop-up doesn't work. Also, setting a password for your Jupyter
server is an important security measure, especially if you're running
Jupyter on a network where others might access it.

Here's how to set up a password with a recent version (\>v5.0) of
Jupyter Notebook:

1.  First, generate a config file if you don't already have one:

    ``` bash
    jupyter notebook --generate-config
    ```

2.  Then, set up a password:

    ``` bash
    jupyter notebook password
    ```

    You'll be prompted to enter and verify your password.

3.  This will create a hashed password in your Jupyter config file. You
    can now start Jupyter normally, and you'll be required to enter this
    password to access your notebooks.

Remember, it's crucial to choose a strong, unique password to protect
your Jupyter environment and any sensitive data in your notebooks.

When running Jupyter on a shared or public network, consider additional
security measures like using SSL encryption or running Jupyter behind a
reverse proxy.

For more advanced topics, refer to the [official Jupyter
documentation](https://docs.jupyter.org/en/latest/) and community
resources.

