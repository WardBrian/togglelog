let rec printer ch =
  match In_channel.input_line ch with
  | None -> ()
  | Some s -> print_endline s; printer ch

let rec skipper ch =
  match In_channel.input_line ch with
  | None -> ()
  | Some s when String.contains s '}' ->
    printer ch
  | Some _ -> skipper ch


let () =
skipper
  In_channel.stdin

