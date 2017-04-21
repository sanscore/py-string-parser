# -*- coding: utf-8 -*-
# pylint: disable=all

extensions = [
    'sphinx.ext.autodoc',
    'sphinx.ext.viewcode',
]

templates_path = ['_templates']
source_suffix = '.rst'
master_doc = 'index'

project = u'PyStringParser'
copyright = u'2017, Grant Welch'
author = u'Grant Welch'

version = u'0.0.1'
release = u'0.0.1'

language = None

exclude_patterns = []
pygments_style = 'sphinx'
todo_include_todos = False

# -- Options for HTML output ----------------------------------------------

html_theme = 'alabaster'
html_static_path = ['_static']
htmlhelp_basename = 'PyStringParserdoc'
