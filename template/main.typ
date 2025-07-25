#import "@local/thesis-template:0.1.0": *
#import "frontmatter.typ": *

#let author = "Ben Dierks"
#let title = "Brief Template Usage Guide"
#let date = datetime.today()

#show: thesis.with( 
  frontmatter: frontmatter(
    university: "Universität des Saarlandes",
    faculty: "Creative Writing",
    field: "Typstology",
    type: "Holy Scripture",
    title: title,
    place: "Saarbrücken",
    author: author,
    date: date,
    first-reviewer: "The Council",
    second-reviewer: "Committee for Good Style",
  ),
  author: author,
  title: title,
  date: date,
  backmatter: [
    #note-outline()
    #bibliography("works.bib")
  ],
)

= Usage Guide

#include("chapters/tutorial.typ")
