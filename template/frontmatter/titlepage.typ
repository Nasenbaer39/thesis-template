#let titlepage(
  university: "",
  faculty: "",
  field: "",
  type: "",
  title: "",
  author: "",
  date: none,
  advisor: "",
  first-reviewer: "",
  second-reviewer: "",
  heading-font: none,
  accent-color: red,
) = {
  set page(margin: (left: 40mm, right: 40mm, top: 50mm, bottom: 50mm))
  set align(center + horizon)
  set par(leading: 15pt)
  
  [
    #text(fill: accent-color, 20pt)[#university]\
    #text(weight: "semibold", 15pt)[
      Faculty of #faculty\
      Department of #field
    ]


      #v(60pt)
      #text(13pt)[#type]

      #v(30pt)
      #line(length:100%, stroke:(thickness: 0.5pt))
      #text(font: (heading-font), 17pt, tracking: 1pt)[#upper(title)]
      #line(length:100%, stroke:(thickness: 0.5pt))


      #v(40pt)
      submitted by\
      #author\
      #date.display("[day].[month].[year]")

      #v(40pt)

      *Advisor:*\
      #advisor

      #v(40pt)

      *Reviewers:*\
      #first-reviewer\
      #second-reviewer
  ]

  pagebreak(weak: true, to: "odd")
}
