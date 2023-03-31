let my_greeting () = 3.1

let () =
  [%toggle_log "TESTING" (my_greeting ())]
