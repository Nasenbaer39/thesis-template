#let titlepage(
  university: "",
  faculty: "",
  field: "",
  type: "",
  title: "",
  author: "",
  date: none,
  first-reviewer: "",
  second-reviewer: "",
  body-font: none,
  heading-font: none,
  accent-color: red,
) = {
  set align(center + horizon)
  set par(leading: 15pt)
  set text(font: body-font)
  page(
    margin: (left: 40mm, right: 40mm, top: 50mm, bottom: 40mm),
    numbering: none,
  )[
    #text(fill: accent-color, 20pt)[#university]\
    #text(weight: "semibold", 15pt)[
      Fakultät für #faculty\
      Fachrichtung #field
    ]


      #v(70pt)
      #text(13pt)[#type]

      #v(40pt)
      #line(length:100%, stroke:(thickness: 0.5pt))
      #text(font: (heading-font), 17pt, tracking: 1pt)[#upper(title)]
      #line(length:100%, stroke:(thickness: 0.5pt))


      #v(40pt)
      vorgelegt von\
      #author\
      am #date.display("[day].[month].[year]")

      #v(60pt)
      Begutachtet von:

      #v(20pt)
      #first-reviewer\
      #second-reviewer
  ]

  pagebreak(weak: true, to: "odd")
}
