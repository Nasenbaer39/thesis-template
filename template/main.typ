#import "@local/thesis-template:0.1.0": *

#show: thesis.with(
  faculty: "Kreatives Schreiben",
  field: "Typstologie",
  type: "Heilige Schrift",
  title: "Brief Template Usage Guide",
  author: "Ben Dierks",
  first-reviewer: "The Council",
  second-reviewer: "Committee for Good Style",

  frontmatter: (
    abstract: include("frontmatter/abstract.typ"),
    acknowledgements: include("frontmatter/acknowledgements.typ"),
  ),

  backmatter: (
    bib: bibliography("works.bib"),
  ),
)

= Usage Guide

#include("chapters/tutorial.typ")


// shows a list of all TODOs in the thesis
#note-outline()
