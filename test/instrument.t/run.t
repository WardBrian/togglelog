By default, nothing is printed
  $ dune exec ./test.exe --force 2> /dev/null

We can instrument with togglelog to
  $ dune exec ./test.exe --instrument-with togglelog --force 2> /dev/null
  [LOG (TESTING) - test.ml:4:2] hi there
  [LOG - test.ml:5:2] hi there (unlabled)
