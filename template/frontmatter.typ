#import "frontmatter/titlepage.typ": *
#import "frontmatter/declaration-of-authorship.typ": *

#let frontmatter(
  university: "",
  faculty: "",
  field: "",
  type: "",
  title: "",
  author: "",
  date: datetime.today(),
  place: "",
  advisor: "",
  first-reviewer: "",
  second-reviewer: "",
  heading-font: "IBM Plex Serif",
  accent-color: red,
) = {
  titlepage(
    university: university,
    faculty: faculty,
    field: field,
    type: type,
    title: title,
    author: author,
    date: date,
    advisor: advisor,
    first-reviewer: first-reviewer,
    second-reviewer: second-reviewer,
    heading-font: heading-font,
    accent-color: accent-color,
  )

  pagebreak(weak: true, to: "odd")

  declaration-of-authorship(
    place: place,
    date: date,
    name: author,
  )
  
  pagebreak(weak: true, to: "odd")

  counter(page).update(1)

  include "frontmatter/acknowledgements.typ"

  pagebreak(weak: true, to: "odd")

  include "frontmatter/abstract.typ"

  pagebreak(weak: true, to: "odd")
}
