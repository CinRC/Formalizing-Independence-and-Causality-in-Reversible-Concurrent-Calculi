
## Temporary repository structure

- `run\`
  + `code.cfg`: compile to run the source code
  + `processes.cfg`: compile to run tests on processes
  + `proof-labels.cfg`: compile to run tests on proof labels
- `code\`
  + `defs-shared.bel`: shared definitions
  + `unique-shared.cfg`: shared proofs of uniqueness
  + `defs-ccskp.bel`: ccskp definitions
  + `unique-ccskp.cfg`: uniqueness of ccskp predicates
  + `unique-step-ccskp.cfg`: uniqueness of ccskp transitions
  + `lemmas-ccskp.cfg`: auxiliary lemmas for ccskp
  + `defs-ccsk.bel`: ccsk definitions
  + `unique-step-ccsk.cfg`: uniqueness of ccsk transitions
- `examples\`
  + `processes\`
    * `standard.bel`: examples of standard processes
    * `keyed.bel`: examples of processes containing keys
    * `stuck-std.bel`: examples of stuck standard processes
    * `stuck-keyed.bel`: examples of stuck processes with keys
  + `proof-labels\`
    * `valid.bel`: examples of valid proof labels
    * `not-valid.bel`: examples of not valid proof labels