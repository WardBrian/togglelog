let my_greeting () = 3.14

let () =
  [%toggle_log "TESTING" (my_greeting ())]
