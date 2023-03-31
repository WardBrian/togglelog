let my_greeting () = failwith "don't call me!" 

let () =
  [%toggle_log "TESTING" (my_greeting ())];
  [%toggle_log "hi there (unlabled)"]
