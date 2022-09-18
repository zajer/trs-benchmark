(lang dune 3.4)

(name benchmark)

(generate_opam_files false)

(source
 (github username/reponame))

(authors "Piotr Cybulski")

(maintainers "Piotr Cybulski")

(license MIT)

(package
 (name benchmark)
 (synopsis "tracking_bigraph library benchmark")
 (description "This project aims to compare performance of tracking_bigraph library to bigraph library for equivalent projects.")
 (depends ocaml dune tracking_bigraph bigraph)
 (tags
  (topics "tracking_bigraph" bigraph benchmark)))

; See the complete stanza docs at https://dune.readthedocs.io/en/stable/dune-files.html#dune-project
