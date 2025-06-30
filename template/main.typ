#import "@local/thesis-template:0.1.0": *
#import "frontmatter.typ": *

#show: thesis.with( 
  frontmatter: frontmatter(
    university: "Universität des Saarlandes",
    faculty: "Creative Writing",
    field: "Typstology",
    type: "Holy Scripture",
    title: "Brief Template Usage Guide",
    author: "Ben Dierks",
    first-reviewer: "The Council",
    second-reviewer: "Committee for Good Style",
  ),
  backmatter: [
    #note-outline()
    #bibliography("works.bib")
  ],
)

= Usage Guide

#include("chapters/tutorial.typ")
