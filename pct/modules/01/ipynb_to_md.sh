#!/bin/bash

# Convert notebooks to markdown
pandoc _git.ipynb -o git.md -t gfm --extract-media=./media
pandoc _jupyter.ipynb -o jupyter.md -t gfm --extract-media=./media
pandoc _env.ipynb -o env.md -t gfm --extract-media=./media

# Clean up and fix formatting
for file in git.md jupyter.md env.md; do
  # Remove all div tags with their attributes
  sed -i 's/<div[^>]*>//g; s/<\/div>//g' "$file"

  # Remove lines with just metadata attributes
  sed -i '/slideshow=/d; /^tags=/d' "$file"

  # Remove specific Python code blocks we know should be hidden
  # This will remove the jupyterquiz code block and surrounding backticks
  sed -i '/``` python/,/```/{/from jupyterquiz/,/```/d}' "$file"

  # Remove ALL empty code blocks
  sed -i '/^``` python$/,/^```$/{/^```/d;}' "$file"

  # Fix escaped backticks
  sed -i 's/\\`/`/g' "$file"

  # Fix colon-fenced admonitions - handle case where closing ::: is at end of a paragraph
  sed -i 's/ :::$/ \n:::/' "$file"

  # Fix admonition with class attribute - separate :class: from title
  sed -i 's/\(:::{admonition} [^:]*\) :class: \([a-z]*\)/\1\n:class: \2/' "$file"

  # Remove any execution_count and other remaining Jupyter artifacts
  sed -i '/execution_count=/d' "$file"
  sed -i '/editable=/d' "$file"

  # Remove any standalone "remove-input" text that might remain
  sed -i '/remove-input/d' "$file"

  # Clean up multiple empty lines (repeats to catch consecutive empty lines)
  sed -i '/^$/N;/^\n$/D' "$file"
  sed -i '/^$/N;/^\n$/D' "$file"
done

echo "Conversion complete with enhanced cleanup"
