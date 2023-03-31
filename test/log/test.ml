let my_greeting () = "hi there"

let () =
  [%toggle_log "TESTING" (my_greeting ())];
  [%toggle_log "hi there (unlabled)"]
