open Ppxlib

let nop ~ctxt () =
  let loc = Expansion_context.Extension.extension_point_loc ctxt in
  Ast_builder.Default.eunit ~loc

let expand ~ctxt _ _ =
  (* TODO - this doesn' check that the second argument has type int *)
  nop ~ctxt ()
