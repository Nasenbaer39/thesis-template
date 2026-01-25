#import "frontmatter/titlepage.typ": *
#import "frontmatter/declaration-of-authorship.typ": *

#let frontmatter(
  university: "",
  faculty: "",
  field: "",
  type: "",
  author: "",
  date: datetime.today(),
  city: "",
  advisor: "",
  first-reviewer: "",
  second-reviewer: "",
  accent-color: red,
) = {
  titlepage(
    university: university,
    faculty: faculty,
    field: field,
    type: type,
    author: author,
    date: date,
    advisor: advisor,
    first-reviewer: first-reviewer,
    second-reviewer: second-reviewer,
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

  include "frontmatter/acknowledgments.typ"

  pagebreak(weak: true, to: "odd")

  include "frontmatter/abstract.typ"

  pagebreak(weak: true, to: "odd")
}
