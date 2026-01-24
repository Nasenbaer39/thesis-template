#let backmatter(
  citation-style: "",
  bibfile: "references.bib"
) = {
  set bibliography(style: citation-style)
  bibliography(bibfile)
}
