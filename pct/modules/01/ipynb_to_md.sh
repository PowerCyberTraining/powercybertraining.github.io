#!/bin/bash

# Convert notebooks to markdown
pandoc _wsl.ipynb -o wsl.md -t gfm --extract-media=./media
pandoc _git.ipynb -o git.md -t gfm --extract-media=./media
pandoc _jupyter.ipynb -o jupyter.md -t gfm --extract-media=./media
pandoc _env.ipynb -o env.md -t gfm --extract-media=./media

# Clean up and fix formatting
for file in wsl.md git.md jupyter.md env.md; do
  # Remove div tags
  sed -i 's/<div class="cell markdown">//g; s/<\/div>//g' "$file"

  # Fix escaped backticks
  sed -i 's/\\`/`/g' "$file"

  # Fix colon-fenced admonitions - first handle simple case
  sed -i 's/\(:::{[a-z]*}\) \(.*\):::/\1\n\2\n:::/' "$file"

  # Fix colon-fenced admonitions - handle case where closing ::: is at end of a paragraph
  sed -i 's/ :::$/ \n:::/' "$file"
done
