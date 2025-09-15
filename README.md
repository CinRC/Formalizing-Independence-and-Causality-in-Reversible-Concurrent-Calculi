# Formalizing Independence and Causality in Reversible Concurrent Calculi

## Overview

This repository contains a formalization of reversible concurrent calculi in [Beluga](https://complogic.cs.mcgill.ca/beluga/index.html).

It extends and refines the [formalization of CCSKP in Beluga](https://github.com/CinRC/A-Beluga-Formalization-of-CCSKP) presented in [*A Formalization of the Reversible Concurrent Calculus CCSKP in Beluga*](https://cgi.cse.unsw.edu.au/~eptcs/paper.cgi?ICE2025.5) with additional results from [*Independence and Causality in the Reversible Concurrent Setting.*](https://doi.org/10.1007/978-3-031-97063-4_2).

[![Code Type Reconstruction](https://github.com/CinRC/Formalizing-Independence-and-Causality-in-Reversible-Concurrent-Calculi/actions/workflows/main.yml/badge.svg)](https://github.com/CinRC/Formalizing-Independence-and-Causality-in-Reversible-Concurrent-Calculi/actions/workflows/main.yml)
[![Example Tests](https://github.com/CinRC/Formalizing-Independence-and-Causality-in-Reversible-Concurrent-Calculi/actions/workflows/test.yml/badge.svg)](https://github.com/CinRC/Formalizing-Independence-and-Causality-in-Reversible-Concurrent-Calculi/actions/workflows/test.yml)

## Usage instructions

Once Beluga is installed and the correct opam switch is enabled (cf. [the installation instructions](#installation-instructions)), it suffices to run

```
beluga run/code.cfg 
```

to perform the type reconstruction of the formalization. Expected result, after ±2 seconds, is

```
## Type Reconstruction begin: run/../code/defs-shared.bel ##
## Type Reconstruction done:  run/../code/defs-shared.bel ##
## Type Reconstruction begin: run/../code/unique-shared.bel ##
## Type Reconstruction done:  run/../code/unique-shared.bel ##
## Type Reconstruction begin: run/../code/defs-ccskp.bel ##
## Type Reconstruction done:  run/../code/defs-ccskp.bel ##
## Type Reconstruction begin: run/../code/unique-ccskp.bel ##
## Type Reconstruction done:  run/../code/unique-ccskp.bel ##
## Type Reconstruction begin: run/../code/unique-step-ccskp.bel ##
## Type Reconstruction done:  run/../code/unique-step-ccskp.bel ##
## Type Reconstruction begin: run/../code/lemmas-ccskp.bel ##
## Type Reconstruction done:  run/../code/lemmas-ccskp.bel ##
## Type Reconstruction begin: run/../code/defs-ccsk.bel ##
## Type Reconstruction done:  run/../code/defs-ccsk.bel ##
## Type Reconstruction begin: run/../code/unique-step-ccsk.bel ##
## Type Reconstruction done:  run/../code/unique-step-ccsk.bel ##
```

Tests can be run using e.g.

```
beluga run/ex-processes.cfg 
```

For this particular set of example, expected result is, after ±1 second, is

```
## Type Reconstruction begin: run/../code/defs-shared.bel ##
## Type Reconstruction done:  run/../code/defs-shared.bel ##
## Type Reconstruction begin: run/../examples/processes/standard.bel ##
## Type Reconstruction done:  run/../examples/processes/standard.bel ##
## Type Reconstruction begin: run/../examples/processes/stuck-std.bel ##
## Type Reconstruction done:  run/../examples/processes/stuck-std.bel ##
## Type Reconstruction begin: run/../examples/processes/keyed.bel ##
## Type Reconstruction done:  run/../examples/processes/keyed.bel ##
## Type Reconstruction begin: run/../examples/processes/stuck-keyed.bel ##
## Type Reconstruction done:  run/../examples/processes/stuck-keyed.bel ##
```

If Makefile is installed, then the previous commands can be replaced by

```
make code
```

and 

```
make test
```

will perform the type reconstruction of all the tests, and is expected to take ±1 second.


## Installation instructions

This mechanization is compatible with [Beluga](https://complogic.cs.mcgill.ca/beluga/) version 1.1.1.

For installation, please refer to the [installation guide](https://github.com/Beluga-lang/Beluga/blob/master/INSTALL) in the GitHub repository of Beluga. Below is a summary.

### Prerequisites

The following must be installed before proceeding with the installation of Beluga:

- opam 2.1.4+: <https://opam.ocaml.org/doc/Install.html>
- GNU Make 4.0+: <https://www.gnu.org/software/make/>
- (optional, for improved beli mode) rlwrap: <https://github.com/hanslub42/rlwrap>

### Debian/Ubuntu

All the necessary prerequisites can be installed with the following commands:

```
$ apt-get install opam
$ opam init --bare
```

And then, from the Beluga directory:

```
$ make setup-install
$ make install
```

### macOS

The easiest way to install the prerequisites is via opam, and the easiest way to install opam is via Homebrew (https://brew.sh/):

```
$ brew install opam
$ opam init --bare
```

And then, from the Beluga directory:

```
$ make setup-install
$ make install
```

### Windows

One option is to install the Ubuntu WSL distribution (https://docs.microsoft.com/en-us/windows/wsl/install) and follow the instructions for Debian/Ubuntu systems.

Another option is to build and execute Beluga on Windows through Cygwin. The necessary prerequisites can be installed using opam for Windows. Here are the steps to follow for the installation through Cygwin:

1. Download opam for Windows' graphical installer OCaml32/64.exe https://fdopen.github.io/opam-repository-mingw/installation/

2. Run OCaml32/64.exe and step through the installation wizard. Note: if you don't already have Cygwin installed, it will be installed for you.

3. Run the following commands from Beluga directory within cygwin terminal.

```
$ opam switch create ocaml-variants.4.09.0+mingw64c
$ eval $(opam env)
```

And then, from the Beluga directory:

```
$ opam install --deps-only ./beluga.opam
```

## Repository structure

- `run\`: Contains the `.cfg` files requires to compile…
  + `code.cfg`: … the actual formalization (in `code/` folder)
  + `ex-processes.cfg`: … test examples on processes (in `examples` folder)
  + `ex-proof-labels.cfg`: … test examples on proof labels (in `examples` folder)
  + `ex-transitions.cfg`: … test examples on transitions (in `examples` folder)
  + `ex-causality-relations.cfg`: … test examples on connectivity, dependence and independence (in `examples` folder)
- `code\`: Contains the Beluga formalization of …
  + `defs-shared.bel`: … shared definitions
  + `unique-shared.cfg`: … shared proofs of uniqueness
  + `defs-ccskp.bel`: … CCSKP definitions
  + `unique-ccskp.cfg`: … uniqueness of CCSKP predicates
  + `unique-step-ccskp.cfg`: … uniqueness of CCSKP transitions
  + `lemmas-ccskp.cfg`: … auxiliary lemmas for CCSKP
  + `defs-ccsk.bel`: … CCSK definitions
  + `unique-step-ccsk.cfg`: … uniqueness of CCSK transitions
- `examples\`: Contains examples serving as tests for…
  + `processes\`: … processes that …
    * `standard.bel`: … are standard
    * `keyed.bel`: … contain keys
    * `stuck-std.bel`: … are standard and stuck
    * `stuck-keyed.bel`: … contain keys and are stuck
  + `proof-labels\`: … proof labels that …
    * `valid.bel`: … are valid
    * `not-valid.bel`: … are not valid
  + `transitions\`: … transitions, in particular …
    * `forward-transitions-ccsk.bel`: … forward transitions in CCSK
    * `backward-transitions-ccsk.bel`: … backward transitions in CCSK
    * `stuck-std-ccsk.bel`: … proofs that some standard processes are stuck in CCSK
    * `stuck-keyed-ccsk.bel`: … proofs that some processes containing keys are stuck in CCSK
    * `forward-transitions-ccskp.bel`: … forward transitions in CCSKP
    * `backward-transitions-ccskp.bel`: … backward transitions in CCSKP
    * `stuck-std-ccskp.bel`: … proofs that some standard processes are stuck in CCSKP
    * `stuck-keyed-ccskp.bel`: … proofs that some processes containing keys are stuck in CCSKP
  + `causality-relations\`: … causality relations on proof labels, in particular …
    * `connectivity.bel`: … connected proof labels
    * `dependence.bel`: … dependent proof labels
    * `independence.bel`: … independent proof labels

The `.github\workflows\` repository contains workflows used to build automatically the code and run the tests.
