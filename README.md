# PowerCyber Training

Bridging advanced cyberinfrastructure with power systems research.

## Usage

### Building the book

If you'd like to develop and/or build the PowerCyber Training book, you should:

1. Clone this repository
2. Run `pip install -r requirements.txt` (it is recommended you do this within a virtual environment)
3. (Optional) Edit the books source files located in the `pct/` directory
4. Run `jupyter-book clean pct/` to remove any existing builds
5. Run `jupyter-book build pct/`

A fully-rendered HTML version of the book will be built in `pct/_build/html/`.

### Using `.ipynb` files with embedded images

Images embedded in `.ipynb` files are not rendered properly by Jupyter Book. The
following is a workaround.

Use `pandoc` to convert `.ipynb` files to `.md` files and extract the images.
For example, to convert `modules/01/_git.ipynb` to `modules/01/git.md`, run the
following command:

```bash
cd modules/01
pandoc _git.ipynb -o git.md -t gfm --extract-media=./media
```

It is very important to note that the `.ipynb` and the `.md` files must NOT have
the same name. Otherwise, Jupyter Book will default to using the `.ipynb` file.
In this example, `_git.ipynb` and `git.md` have different names.

In `_toc.yml`, refer to the converted `.md` file instead of the `.ipynb` file.

### Hosting the book

Please see the [Jupyter Book documentation](https://jupyterbook.org/publish/web.html) to discover options for deploying a book online using services such as GitHub, GitLab, or Netlify.

For GitHub and GitLab deployment specifically, the [cookiecutter-jupyter-book](https://github.com/executablebooks/cookiecutter-jupyter-book) includes templates for, and information about, optional continuous integration (CI) workflow files to help easily and automatically deploy books online with GitHub or GitLab. For example, if you chose `github` for the `include_ci` cookiecutter option, your book template was created with a GitHub actions workflow file that, once pushed to GitHub, automatically renders and pushes your book to the `gh-pages` branch of your repo and hosts it on GitHub Pages when a push or pull request is made to the main branch.

## Contributors

We welcome and recognize all contributions. You can see a list of current contributors in the [contributors tab](https://github.com/cuihantao/pct/graphs/contributors).

## Credits

This project is created using the excellent open source [Jupyter Book project](https://jupyterbook.org/) and the [executablebooks/cookiecutter-jupyter-book template](https://github.com/executablebooks/cookiecutter-jupyter-book).
