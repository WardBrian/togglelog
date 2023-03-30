# togglelog - an OCaml PPX extension for zero-cost debug logging

**This was an experiment and my first PPX driver. Further development is currently unlikely.**

This is a [PPX extension](https://ocaml.org/docs/metaprogramming) for OCaml that allows you to add logging to your code which is completely removed at compile time in release builds.

## Example

```ocaml
let () = [%toggle_log "Hello, world!"];
         [%toggle_log "SPECIFIER" (some_potentially_expensive_function ())]
```

By default, the above code will be translated to (something equivalent to) the following:
```ocaml
let () = (); ()
```

The PPX rewriter has an `--enable` flag which can be used to enable logging. When enabled, the above code will be translated to the following:
```ocaml
let () =
Printf.printf "[LOG - example.ml:1:9] %s\n" "Hello, world!";
Printf.printf "[LOG (SPECIFIER) - %s\n" (some_potentially_expensive_function ())
```

This lets you add logging to your code without worrying about the performance impact in release builds.

## Usage

### Dune

To use `togglelog` in your Dune project, add the following to your `dune` file:
```scheme
(exectuable
  (name myexe)
  (libraries togglelog)
  (preprocess (pps togglelog))
  (instrumentation (backend togglelog --enable)))
```

This sets up `togglelog` to be used during all builds, but will only enable logging when Dune is invoked
with the `--instrument-with togglelog` flag.


## Specifiers

When two arguments are passed to the `%toggle_log` PPX, the first is a "specifier".
This literal string is printed as part of the message.
Maybe one day it will be usable for filtering which log messages are printed.
