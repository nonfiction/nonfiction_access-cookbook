# encoding: utf-8
name             'nonfiction_access'
maintainer       'Darron Froese'
maintainer_email 'darron@froese.org'
license          'Apache 2.0'
description      'Installs/configures access for nonfiction including ssh keys'
version          '0.3.0'
recipe           'nonfiction_access::default', 'Installs/configures access for nonfiction including ssh keys'

depends 'sudo'
