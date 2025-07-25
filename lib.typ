#import "@preview/hydra:0.6.1": hydra
#import "@preview/outrageous:0.4.0" as outrageous

#import "src/frontmatter.typ": *
#import "src/utils.typ": *

#let thesis(
  university: "Universität des Saarlandes",
  place: "Saarbrücken",
  faculty: "Your Faculty",
  field: "Your Field",
  type: "Thesis Type",
  title: "Your Title",
  author: "Your Name",
  date: datetime.today(),
  advisor: "Advisor of your thesis",
  first-reviewer: "First Reviewer",
  second-reviewer: "Second Reviewer",
  style: "style.csl",
  frontmatter: (
    abstract: none,
    acknowledgements: none,
  ),
  backmatter: (
    bib: none,
  ),
  body,
) = {

  /*------[Fonts and Measurements]------*/

  let body-font = "IBM Plex Sans"
  let heading-font = "IBM Plex Serif"
  let caption-font = "IBM Plex Serif"
  let math-font = "STIX Two Math"
  let body-size = 11pt
  let h1-size = 22pt
  let h2-size = 14pt
  let h3-size = body-size
  let h4-size = body-size
  let caption-size = 10pt
  let accent-color = rgb(165, 28, 48)

  /*------[General Settings]------*/

  set document(title: title, author: author, date: date)
  set bibliography(style: "style.csl")

  let in-body = state("in-body", false)

    //===========================//
   //-------- Titlepage --------//
  //===========================//

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
    body-font: body-font,
    heading-font: heading-font,
    accent-color: accent-color,
  )

  /*------[Page Layout]------*/

  // Use measures to define text layout
  set text(font: body-font, size: body-size)
  show math.equation: set text(font: math-font, fallback: false)


  /*------[Fancy Hydra-Header]------*/

  let custom-header(title, dir, it) = {
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

  set page(
    paper: "a4",
    margin: (
      bottom: 3cm,
      top: 4cm,
      inside: 4cm,
      outside: 3cm,
    ),
    header: context {
      // Check if header should be removed (page is empty)
      if not state("content.switch", false).get() {
        return
      }

      // select header type based on page number
      if calc.even(here().page()) {
        align(left, emph(hydra(1, display: (_, it) => {
          custom-header("Chapter", rtl, it)   // Chapter title on the left of even pages
        })))
      } else {
        align(right, emph(hydra(2, display: (_, it) => {
            custom-header("Section", ltr, it)   // Section title on the right of odd pages
          }, 
          skip-starting: false))
        )
      }
    },
    footer: []
  )

  set par(
    spacing: 1.5em,
    justify: true,
  )

  /*------[Heading Style]------*/

  show heading: it => {
    v(2.5em, weak: true)
    it
    v(1.5em, weak: true)
  }

  show heading.where(level: 1): it => [
    #set text(size: h1-size, weight: "medium", font: heading-font)
    #set align(right)

    #if in-body.get() {
      v(30pt)
      let heading-number = text(
          counter(heading).display(),
          size: 26pt,
        )
      box[
        #set align(horizon)
        #stack(
          dir: ltr,
          line(length: 30pt, angle: 90deg, stroke: (thickness: 0.75pt)),
          h(0.75em),
          heading-number,
        )
      ]
    }

    #it.body
    #v(30pt)
  ]

  show heading.where(level: 2): it => {text(size: h2-size, it)}
  show heading.where(level: 3): it => {text(size: h3-size, it)}
  show heading.where(level: 4): it => {text(size: h4-size, weight: "semibold", it.body) + h(1em)}
  show heading.where(level: 5): it => {text(size: h4-size, weight: "semibold", it.body)}

  /*------[Figure Style]------*/

  set figure(numbering: n => {
      counter(figure.where(kind: "subfigure")).update(0)
      numbering("1.1", counter(heading.where(level: 1)).get().first(), n)
    },
    placement: auto
  )
  
  show figure.where(kind: "code"): set figure(supplement: [Algorithm])
  show figure.where(kind: "subfigure"): set figure(supplement: [], numbering: "(a)", outlined: false, placement: none)

  show figure.caption: it => {
    set text(font: (caption-font), size: caption-size)

    layout(size => context {
      // Get length of caption text
      let caption-length = measure(
        ..size,
        it.supplement + it.separator + it.body,
      )

      // Center caption if less than one line
      if caption-length.width < size.width {
        set align(center)
      }

      // Make figure title bold and caption italic
      context {
        set align(left)
        if it.kind == "subfigure" {
          // don't display separator if it's a subfigure
          strong[#it.supplement #it.counter.display(it.numbering) ]
        } else {
          strong[#it.supplement #it.counter.display(it.numbering)#it.separator]
        }
        emph(it.body)

        // add spacing between mainfigure caption and subfigure
        if it.kind == "subfigure" {v(0.75em)}
      }
    })
  }

  declaration-of-authorship(
    place: place,
    date: date,
    name: author,
  )


    //===========================//
   //------ Front Matter -------//
  //===========================//

  set page(numbering: "i")

  counter(page).update(1)

  // Add abstract if present
  if frontmatter.abstract != none {
    abstract()[#frontmatter.abstract]
  }

  // Add acknowledgements if present
  if frontmatter.acknowledgements != none {
    acknowledgements()[#frontmatter.acknowledgements]
  }

  /*------[Outline Styling]------*/

  show outline.entry: outrageous.show-entry.with(
    font: (body-font, auto),
    vspace: (15pt, none),
  )

  show outline: it => {
    set heading(outlined: true)
    it
    pagebreak(weak: true, to: "odd")
  }

  // Show outline
  outline(depth: 3)


   //===========================//
  //------ Document Body ------//
 //===========================//

  in-body.update(true)

  set page(numbering: "1")
  set heading(numbering: "1.1")

  counter(page).update(1)
  counter(heading).update(0)

  // Setup custom numbering of math functions: (chapter.number)
  set math.equation(number-align: bottom + end, supplement: none, numbering: num => {
      let count = counter(heading.where(level: 1)).get().first()
      numbering("(1.1)", count, num)
  })

  // Give links the accent color
  show link: set text(accent-color)

  // Give different types of references a custom style
  show ref: it => {
    let e = it.element

    // color name and date in citations
    if e == none {
      show regex("[\d\p{L}\s.]+"): set text(accent-color)
      it
    // reference figures as "Fig. {chapter}.{figure}[subfigure]"
    } else if e.func() == figure {
      if e.kind == "subfigure" {
        let q = query(figure.where(outlined: true).before(it.target)).last()
        // display mainfigure and subfigure counter after each other if subfigure is referenced
        [Fig.~] + link(e.location(), numbering(q.numbering, ..counter(figure.where(kind: q.kind)).at(q.location())) +
        numbering("a", ..counter(figure.where(kind: "subfigure")).at(e.location())))
      } else {
        if e.kind == "code" [Alg.~] else if e.kind == table [Tab.~] else [Fig.~] + link(e.location(), numbering(e.numbering, ..counter(figure.where(kind: e.kind)).at(e.location())))
      }
    // color equation numbering, but not parentheses
    } else if e.func() == math.equation {
      show regex("[^()]+"): set text(accent-color)
      it
    // reference l1 headers has "Chapter" and all others as "Section"
    } else if e.func() == heading {
      if e.level == 1 [Chapter~] else [Section~]
      link(e.location(), numbering(e.numbering, ..counter(heading).at(e.location())))
    } else {
      it
    }
  }

  /*------[Chapter Start]------*/

  show heading.where(level: 1): it => {
    // Reset figure and equation numbering on every chapter start
    for kind in (image, table, raw, "code") {
      counter(figure.where(kind: kind)).update(0)
    }

    counter(figure).update(0)
    counter(math.equation).update(0)

    // Start chapter headings on a new page
    state("content.switch").update(false)
    pagebreak(weak: true, to:"odd")
    state("content.switch").update(true)

    it
  }

  body


   //===========================//
  //------- Back Matter -------//
 //===========================//

  in-body.update(false)

  // remove custom header
  set page(header: [])

  if backmatter.bib != none {
    backmatter.bib
  }
}
