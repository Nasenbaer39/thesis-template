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
    place: "Your City",
    author: author,
    date: date,
    advisor: "Your Advisor",
    first-reviewer: "Your First Reviewer",
    second-reviewer: "Your Second Reviewer",
    abstract: [
      #lorem(150)

      #lorem(50)
    ],
    acknowledgments: [
      #lorem(320)

      #lorem(80)
    ]
  ),
  author: author,
  title: title,
  date: date,
  appendix: [
    // Optional content for the appendix
  ],
  backmatter: backmatter(
    bibliography:  bibliography("references.bib"),
    // The citation style can be set to one of Typst's built-in options or a custom .csl file
    bib-style: "ieee"
  )
)

= Your First Chapter

#lorem(75)

#lorem(130)

#lorem(90)
