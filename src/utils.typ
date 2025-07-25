#import "@preview/drafting:0.2.2": *
#import "@preview/catppuccin:1.0.0": latte


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
// #nested-figure(
//   caption: [main-figure caption],
//   [#subfigure(image("first_subfigure.content"), caption: [first sub-figure caption]) <first-sub-figure-reference>],
//   [#subfigure(image("second_subfigure.content"), caption: [second sub-figure caption]) <second-sub-figure-reference>],
//   ...add more sub-figures below
// )

#let subfigure = figure.with(kind: "subfigure")

#let nested-figure(caption: [], multi-row: false, spacing: 2em, alignment: bottom, ..args) = {
  figure({
    set align(alignment)
    set figure.caption(position: alignment)
    if multi-row {
      grid(columns: 2, gutter: 10pt, ..args,)
    } else {
      stack(
        dir: ltr,
        spacing: spacing,
        ..args,
      )
    }},
    caption: caption
  )
}

/*------[Shorthand to color math symbols]------*/

#let col-math(x, color: latte.colors.green.rgb) = text(fill: color)[#x]
