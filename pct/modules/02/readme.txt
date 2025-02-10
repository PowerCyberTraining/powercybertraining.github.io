(1) If you want to run it on Jupyter Notebook, please set (your saved \pct path)\pct\modules\02 as the current working directory for Jupyter Notebook.

(2) If you want to render the Jupyter Notebook as HTML, 

1. Please set the path to (your saved \pct path)\pct.

2. Add this setting to _config.yml

execute:
  timeout: -1

3. If you do not wait for a long time for the machine learning process, please set
execute:
  execute_notebooks: "off"
_
in the config.yml
 