open Ppxlib

let logger_name = "_log"

let null ~loc = [%expr ()]

(* also accepts log type argument to potentially generate a conditional *)
let call ~loc _ =
  let fun_name = Ast_builder.Default.evar ~loc logger_name in
  [%expr [%e fun_name] ()]

(** This does some tricks to guarantee typechecking of the log string.
    We generate a expression like
    [let _log () = PRINT ... in _log ()]
    when printing is enabled, and
    [let _log () = PRINT ... in ()]
    when it is disabled.
  *)
let build_log ~ctxt ?(enabled = true) ?log_type log_string =
  let loc = Expansion_context.Extension.extension_point_loc ctxt in
  let logger_label =
    match log_type with
    | Some typ -> Printf.sprintf "LOG (%s)" typ
    | None -> "LOG"
  in
  let pos_string =
    Printf.sprintf "[%s - %s:%d:%d] " logger_label loc.loc_start.pos_fname
      loc.loc_start.pos_lnum
      (loc.loc_start.pos_cnum - loc.loc_start.pos_bol)
  in
  let fun_name =
    Ast_builder.Default.ppat_var ~loc (Loc.make ~loc logger_name)
  in
  let fun_body =
    [%expr
      Printf.printf "%s%s\n"
        [%e Ast_builder.Default.estring ~loc pos_string]
        [%e log_string]]
  in
  let maybe_call = if enabled then call ~loc log_type else null ~loc in
  [%expr
    let [%p fun_name] = fun () -> [%e fun_body] in
    [%e maybe_call]]

let expand_null ~ctxt log_type log_string =
  build_log ~ctxt ~enabled:false ?log_type log_string

let expand_log ~ctxt log_type log_string = build_log ~ctxt ?log_type log_string
