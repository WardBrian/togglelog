The output of the preprocessor when not processing
  $ dune describe pp test.ml | ocaml filter.ml
  let my_greeting () = "hi there"
  let () =
    (let _log () =
       Stdlib.Printf.printf "%s%s\n" "[LOG (TESTING) - test.ml:4:2] "
         (my_greeting ()) in
     ());
    (let _log () =
       Stdlib.Printf.printf "%s%s\n" "[LOG - test.ml:5:2] "
         "hi there (unlabled)" in
     ())

The output when logging is enabled
  $ dune describe pp --instrument-with togglelog test.ml | ocaml filter.ml
  let my_greeting () = "hi there"
  let () =
    (let _log () =
       Stdlib.Printf.printf "%s%s\n" "[LOG (TESTING) - test.ml:4:2] "
         (my_greeting ()) in
     match Stdlib.Sys.getenv_opt "OCAML_TOGGLELOG" with
     | None -> _log ()
     | Some s when List.mem "TESTING" (String.split_on_char ',' s) -> _log ()
     | _ -> ());
    (let _log () =
       Stdlib.Printf.printf "%s%s\n" "[LOG - test.ml:5:2] "
         "hi there (unlabled)" in
     match Stdlib.Sys.getenv_opt "OCAML_TOGGLELOG" with
     | None -> _log ()
     | Some s when List.mem "" (String.split_on_char ',' s) -> _log ()
     | _ -> ())
