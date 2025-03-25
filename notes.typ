#set page(paper: "a4")
#set text(
  font: "Atkinson Hyperlegible",
  hyphenate: false,
)
#set par(justify: true)

#let pdfpc = json("slides.pdfpc")

#assert(pdfpc.keys().contains("pdfpcFormat") and pdfpc.pdfpcFormat == 2)

#let pages = pdfpc.pages

#assert(type(pages) == array)

#let pages-with-notes = pages.filter(it => it.keys().contains("note"))

#let part(note: str, page: str) = block(
  above: 2em,
  stroke: 0.5pt,
  width: 100%,
  inset: 14pt,
)[
  #place(
    top + left,
    dy: -6pt - 14pt, // Account for inset of block
    dx: 6pt - 14pt,
    block(fill: white, inset: 2pt)[Page Number: #page],
  )
  #par(note)
]

#(
  pages-with-notes
    .map(it => (
      note: it.note,
      page: it.idx,
    ))
    .map((
      (note, page),
    ) => part(
      note: note,
      page: page,
    ))
    .join()
)
