open Ppxlib

(**
    Some "magic" to get the typechecker to complain about non-strings.

    This compiles to [ignore (if true then "dummy" else (fun () -> e2) ())].
    Which checks that e2 has type [str], but dead-code-elimation simplifies
    to [ignore "dummy"] and then removes.
    *)
let expand ~ctxt _ e2 =
  let loc = Expansion_context.Extension.extension_point_loc ctxt in
  Ast_builder.Default.(
    eapply ~loc
      (evar ~loc "Stdlib.ignore")
      [
        pexp_ifthenelse ~loc (ebool ~loc true) (estring ~loc "dummy")
          (Some
             (eapply ~loc
                (pexp_fun ~loc Nolabel None
                   (ppat_construct ~loc (Located.lident ~loc "()") None)
                   e2)
                [ eunit ~loc ]));
      ])
