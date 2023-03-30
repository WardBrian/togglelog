let my_greeting () = "hi there" [@@warning "-32"]

let () =
  [%toggle_log "TESTING" (my_greeting ())];
  [%toggle_log "hi there (unlabled)"]
