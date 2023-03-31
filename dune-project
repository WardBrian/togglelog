(lang dune 3.6)

(name togglelog)

(generate_opam_files true)

(source
 (github WardBrian/togglelog))

(authors "Brian Ward")

(maintainers "Brian Ward")

(license MIT)

(cram enable)

(version "0.1.0")

(package
 (name togglelog)
 (synopsis "A ppx for compile-time-optional logging")
 (depends
  (ocaml
   (>= 4.12.0))
  dune
  (ppxlib
   (>= 0.22))))

; See the complete stanza docs at https://dune.readthedocs.io/en/stable/dune-files.html#dune-project
