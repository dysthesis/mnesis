import VersoManual
import Book.Introduction

open Verso.Genre Manual
open Verso.Genre.Manual.InlineLean

set_option pp.rawOnError true

#doc (Manual) "Mnesis" =>

%%%
authors := ["Dysthesis"]
%%%

Mnesis is a work-in-progress protocol to unify the management of personal data.
The spirit of this project shares a root with ATProto: a self-hosted "server"
(more on why that's in quotation later) storing all of one's data, and apps or
services would simply make requests to query and/or mutate said data. The result
is that said data is

* portable, as no service may hold one's data ransom, making switching cost
  negligible,
* interoperable, as data can be trivially shared between apps or services,
  without the need for the blessings of said apps or services -- only that of
  the user, and
* long-lived, due to the aformentioned lack of switching cost, and the
  standardisation of protocol granting it malleability.

Note that this project merely describes -- and verifies properties about --
a protocol. It does not contain implementations of any clients or servers, 
though one is planned on the roadmap. We seek to allow anyone to build their own
implementations of servers to store data, or apps or services which runs on top
of it.

{include 1 Book.Introduction}
