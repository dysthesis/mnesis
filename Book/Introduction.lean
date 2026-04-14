import VersoManual

open Verso.Genre Manual
open Verso.Genre.Manual.InlineLean

#doc (Manual) "Introduction" =>

The data plane of Mnesis consists of twofolds, namely,

* a labelled, directed graph $`G = (V, E) ∈ \mathbb{G}`, and
* an append-only event log $`L = (e_0, e_1, ⋯), e_i : \mathbb{G} → \mathbb{G}, 
  e_i ∈ Σ`, describing mutations on $`G`.

Mutations can be informally thought of as the standard CRUD operations on the
graph.
