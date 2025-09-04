# Formalizing Independence and Causality in Reversible Concurrent Calculi

This repository contains the implementation of reversible concurrent calculi in [Beluga](https://complogic.cs.mcgill.ca/beluga/index.html).


## Repository structure

- `run\`: Contains the `.cfg` files requires to compile…
  + `code.cfg`: … the actual implementation (in `code/` folder)
  + `ex-processes.cfg`: … test examples on processes (in `examples` folder)
  + `ex-proof-labels.cfg`: … test examples on proof labels (in `examples` folder)
- `code\`: Contains the Beluga implementation of …
  + `defs-shared.bel`: … shared definitions
  + `unique-shared.cfg`: … shared proofs of uniqueness
  + `defs-ccskp.bel`: … ccskp definitions
  + `unique-ccskp.cfg`: … uniqueness of ccskp predicates
  + `unique-step-ccskp.cfg`: … uniqueness of ccskp transitions
  + `lemmas-ccskp.cfg`: … auxiliary lemmas for ccskp
  + `defs-ccsk.bel`: … ccsk definitions
  + `unique-step-ccsk.cfg`: … uniqueness of ccsk transitions
- `examples\`: Contains examples serving as tests for…
  + `processes\`: … processes that …
    * `standard.bel`: … are standard
    * `keyed.bel`: … contain keys
    * `stuck-std.bel`: … are standard and stuck
    * `stuck-keyed.bel`: … contain keys and are stuck
  + `proof-labels\`: … proof labels that …
    * `valid.bel`: … are valid
    * `not-valid.bel`: … are not valid
