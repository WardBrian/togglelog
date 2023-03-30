let my_greeting () = 3.1 [@@warning "-32"]

let () =
  [%toggle_log "TESTING" (my_greeting ())]
