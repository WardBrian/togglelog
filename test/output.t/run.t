The output of the preprocessor when not processing
  $ dune describe pp test.ml
  [@@@ocaml.ppx.context
    {
      tool_name = "ppx_driver";
      include_dirs = [];
      load_path = [];
      open_modules = [];
      for_package = None;
      debug = false;
      use_threads = false;
      use_vmthreads = false;
      recursive_types = false;
      principal = false;
      transparent_modules = false;
      unboxed_types = false;
      unsafe_string = false;
      cookies = []
    }]
  let my_greeting () = "hi there"
  let () =
    (let _log () =
       Printf.printf "%s%s\n" "[LOG (TESTING) - test.ml:4:2] " (my_greeting ()) in
     ());
    (let _log () =
       Printf.printf "%s%s\n" "[LOG - test.ml:5:2] " "hi there (unlabled)" in
     ())

The output when logging is enabled
  $ dune describe pp --instrument-with togglelog test.ml
  [@@@ocaml.ppx.context
    {
      tool_name = "ppx_driver";
      include_dirs = [];
      load_path = [];
      open_modules = [];
      for_package = None;
      debug = false;
      use_threads = false;
      use_vmthreads = false;
      recursive_types = false;
      principal = false;
      transparent_modules = false;
      unboxed_types = false;
      unsafe_string = false;
      cookies = []
    }]
  let my_greeting () = "hi there"
  let () =
    (let _log () =
       Printf.printf "%s%s\n" "[LOG (TESTING) - test.ml:4:2] " (my_greeting ()) in
     _log ());
    (let _log () =
       Printf.printf "%s%s\n" "[LOG - test.ml:5:2] " "hi there (unlabled)" in
     _log ())
