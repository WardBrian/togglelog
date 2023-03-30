open Ppxlib

let print_log ~ctxt ?log_type log_string =
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
  Ast_builder.Default.(
    eapply ~loc
      (evar ~loc "Printf.printf")
      [ estring ~loc (pos_string ^ "%s\n"); log_string ])

let expand ~ctxt log_type log_string = print_log ~ctxt ?log_type log_string
