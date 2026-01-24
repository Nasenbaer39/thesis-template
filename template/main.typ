#import "@local/thesis-template:0.1.0": *
#import "frontmatter.typ": *
#import "backmatter.typ": *

#let author = "Your Name"
#let title = "Your Thesis Title"
#let date = datetime.today()

#show: thesis.with(
  frontmatter: frontmatter(
    university: "Your University",
    faculty: "Your Faculty",
    field: "Your Program of Study",
    type: "Thesis Type",
    title: title,
    city: "Your City",
    author: author,
    date: date,
    advisor: "Your Advisor",
    first-reviewer: "Your First Reviewer",
    second-reviewer: "Your Second Reviewer",
  ),
  author: author,
  title: title,
  date: date,
  appendix: [
    // Optional content for the appendix
  ],
  backmatter: backmatter(
    bibfile: "references.bib",
    // The citation style can be set to one of Typst's built-in options or a custom .csl file
    citation-style: "ieee"
  )
)

= Usage Guide

#include("chapters/tutorial.typ")
