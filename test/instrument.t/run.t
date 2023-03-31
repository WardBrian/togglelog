By default, nothing is printed
  $ dune exec ./test.exe --force

We can instrument with togglelog to 
  $ dune exec ./test.exe --instrument-with togglelog --force
  [LOG (TESTING) - test.ml:4:2] hi there
  [LOG - test.ml:5:2] hi there (unlabled)
