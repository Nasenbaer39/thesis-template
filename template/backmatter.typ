#let std-bibliography = bibliography

#let backmatter(
  bibliography: [],
  bib-style: "",
) = {
  set std-bibliography(style: bib-style)
  bibliography
}
