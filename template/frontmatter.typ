#import "frontmatter/titlepage.typ": *
#import "frontmatter/declaration-of-authorship.typ": *
#import "frontmatter/outline.typ": *

#let frontmatter(
  university: "",
  faculty: "",
  field: "",
  type: "",
  author: "",
  date: datetime.today(),
  place: "",
  advisor: "",
  first-reviewer: "",
  second-reviewer: "",
  accent-color: red,
  abstract: [],
  acknowledgments: [],
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

  declaration-of-authorship(
    place: place,
    date: date,
    name: author,
  )

  counter(page).update(1)

  [
    = Abstract

    #abstract
  ]

  [
    = Acknowledgments

    #acknowledgments
  ]

  default-outline()
}
