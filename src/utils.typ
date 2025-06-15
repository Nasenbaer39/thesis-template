#import "@preview/drafting:0.2.2": *

/*------[Fancy Hydra-Header]------*/

#let custom-header(title, dir, it) = {
  set text(style: "oblique")
  stack(
    dir: dir,
    [
      *#title #numbering(it.numbering, ..counter(heading).at(it.location()))*
      #h(7pt)
      #it.body
    ],
    [#h(7pt)|#h(7pt)],
    counter(page).display()
  )
  v(5pt)
}


/*------[Signature Line]------*/

#let signature(
  place:"",
  date:none,
  name:"",
) = {
  grid(
    columns: (auto, auto),
    align(left)[
      #place, #date.display("[month repr:long] [day], [year]")
      #h(12pt)
    ],
    align(right)[
      #move(dy: 8pt, line(length: 100%, stroke: (thickness: 0.5pt)))
      #move(dy: 2pt,name)
    ],
  )
}


/*------[TODO Tools]------*/

#let todo(body, color: yellow, title: "TODO") = {
  let shape = rect.with(inset: 0.75em, radius: 0.5em)
  inline-note(rect: shape, stroke: color, fill: color.lighten(60%))[
    #text(weight: 700)[#title]: #body
  ]
}

#let note(body, color: red) = {
  margin-note(stroke: color)[
    #set par(justify: false)
    #set text(weight: "medium")
    #body
  ]
}


/*------[Shorthand for Prose Citations]------*/

#let pc = (citation) => {
  set cite(form: "prose")
  citation
}


/*------[Helpers to create Subfigures]------*/

// Example:
// #subfigures(
//   caption: [mainfigure caption],
//   [#subfigure(image("first_subfigure.content"), caption: [first subfigure caption]) <first subfigure reference>],
//   [#subfigure(image("second_subfigure.content"), caption: [second subfigure caption]) <second subfigure reference>],
//   ...add more subfigures below
// )

#let subfigure = figure.with(kind: "subfigure")

#let nested-figure(caption: [], spacing: 2em, ..args) = {
  figure({
    set align(bottom)
    stack(
      dir: ltr,
      spacing: spacing,
      ..args,
    )},
    caption: caption
  )
}
