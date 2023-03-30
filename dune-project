(lang dune 3.6)

(name togglelog)

(generate_opam_files true)

(source
 (github WardBrian/togglelog))

(authors "Brian Ward")

(maintainers "Brian Ward")

(license LICENSE)

(documentation https://url/to/documentation)

(cram enable)

(package
 (name togglelog)
 (synopsis "A ppx for compile-time-optional logging")
 (description "A longer description")
 (depends
  (ocaml
   (>= 4.12.0))
  dune
  (ppxlib
   (>= 0.22)))
 (tags
  (topics "to describe" your project)))

; See the complete stanza docs at https://dune.readthedocs.io/en/stable/dune-files.html#dune-project
