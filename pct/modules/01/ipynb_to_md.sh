#!/bin/bash

pandoc _git.ipynb -o git.md -t gfm --extract-media=./media
pandoc _jupyter.ipynb -o jupyter.md -t gfm --extract-media=./media
pandoc _env.ipynb -o env.md -t gfm --extract-media=./media