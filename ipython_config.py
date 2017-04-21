# IPython configuration
# tox -econsole
# pylint: disable=all

c.InteractiveShellApp.exec_lines = [
    'import inspect',
    'from strparse import StringParser',
]

c.InteractiveShell.banner2 = 'StringParser Console\n======================\n\n%s\n' % '\n'.join(c.InteractiveShellApp.exec_lines)
