c = get_config()
c.IPKernelApp.pylab = 'inline'
c.NotebookApp.notebook_dir = '/notebook'
c.NotebookApp.ip = '0.0.0.0'
c.NotebookApp.port = 8080
c.NotebookApp.password = 'sha1:a60dbaa6976b:39aa9c83c4a246ddcc45d0c0b6e0efeca6ce96e7'
c.NotebookApp.open_browser = False
c.NotebookApp.allow_root = True