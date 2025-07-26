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

#let comment(body, color: blue.darken(25%), sh: "") = {
  math.attach(tl: sh)[]
  inline-note(stroke: blue.darken(25%), par-break: false)[
    #body
  ]
}

/*------[Shorthand for Prose Citations]------*/

#let pc = (citation) => {
  set cite(form: "prose")
  citation
}


/*------[Helpers to create Subfigures]------*/

#let subfigure = figure.with(kind: "subfigure")


/*------[Shorthand to color math symbols]------*/

#let col-math(x, color: latte.colors.green.rgb) = text(fill: color)[#x]
