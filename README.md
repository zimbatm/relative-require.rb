relative-require.rb
===================

This module provides relative requires to the requiring file. This should solve
most of the uglyness of pushing to $LOAD_PATH and loading #expand_path-ed files.

by Jonas Pfenniger <jonas@pfenniger.name>

Example project
---------------

This example shows that you don't have to mess with $LOAD_PATH anymore.

$ export RUBYOPT=-relative-require

lib/
* myproject.rb
* myproject/xyz.rb
test/
  test.rb

in myproject.rb
  require './myproject/xyz.rb'

in test.rb
  require '../lib/myproject.rb'

Licence
-------

This project is under public licence. http://unlicence.org

