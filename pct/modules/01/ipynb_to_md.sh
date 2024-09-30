#!/bin/bash

pandoc _git.ipynb -o git.md --extract-media=./media
pandoc _jupyter.ipynb -o jupyter.md --extract-media=./media
pandoc _env.ipynb -o env.md --extract-media=./media