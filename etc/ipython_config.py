c = get_config()

## -------------- CUSTOM BELOW --------------

# Run all nodes interactively
c.InteractiveShell.ast_node_interactivity = "all"

c.InlineBackend.figure_format = 'retina'

c.InteractiveShellApp.reraise_ipython_extension_failures = True
# c.InteractiveShellApp.extensions = ['dask_extension']

c.InteractiveShellApp.extensions = ['taskmates_enterprise_gateway.file_editing_magics']
