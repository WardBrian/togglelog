open Ppxlib

let enabled = ref false

let extractor () =
  Ast_pattern.(
    alt_option
      (single_expr_payload @@ pexp_apply (estring __) (no_label __ ^:: nil))
      (single_expr_payload __))

let () =
  Ppxlib.Driver.add_arg "--enable" (Arg.Set enabled) ~doc:"compile-in logging";
  let expand ~ctxt =
    if !enabled then Mapper.expand ~ctxt else Null_mapper.expand ~ctxt
  in
  let extension =
    Extension.V3.declare "toggle_log" Extension.Context.expression
      (extractor ()) expand
  in
  let rule = Ppxlib.Context_free.Rule.extension extension in
  Ppxlib.Driver.register_transformation "togglelog" ~rules:[ rule ]
