(** Removes the
   [@@@ocaml.ppx.context
     {
    ...
    }]

  Block from output of [dune describe pp]
*)

let rec printer ch =
  let s = read_line () in
  print_endline s;
  printer ()

let rec skipper () =
  let s = read_line () in
  if String.contains s '}' then printer () else skipper ()

let () = try skipper () with End_of_file -> ()
