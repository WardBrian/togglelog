Show that a type error is thrown whether or not logging is actually enabled

  $ dune exec ./test.exe --force 2>&1 | sed 's/"float\"/float/g' | sed 's/"string\"/string/g'
  File "test.ml", line 4, characters 25-41:
  4 |   [%toggle_log "TESTING" (my_greeting ())]
                               ^^^^^^^^^^^^^^^^
  Error: This expression has type float but an expression was expected of type
           string

  $ dune exec ./test.exe --instrument-with togglelog --force 2>&1 | sed 's/"float\"/float/g' | sed 's/"string\"/string/g'
  File "test.ml", line 4, characters 25-41:
  4 |   [%toggle_log "TESTING" (my_greeting ())]
                               ^^^^^^^^^^^^^^^^
  Error: This expression has type float but an expression was expected of type
           string
