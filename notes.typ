#set page(paper: "a4")
#set text(
  font: "Atkinson Hyperlegible",
  hyphenate: false,
)
#set par(justify: true, linebreaks: "optimized")

#let pdfpc = json("slides.pdfpc")

#assert(pdfpc.keys().contains("pdfpcFormat") and pdfpc.pdfpcFormat == 2)

#let pages = pdfpc.pages

#assert(type(pages) == array)

#let pages-with-notes = pages.filter(it => it.keys().contains("note"))

#let part(note: "", page: str) = block(
  above: 2em,
  stroke: 0.5pt,
  width: 100%,
  inset: 14pt,
  breakable: false,
  {
    assert(note != "")

    let wc = note.split(" ").map(it => it.split("\n")).flatten().filter(it => it != "").len()

    let title = note.split(" \n \n").first().trim()
    let title = title.codepoints().slice(0, calc.min(title.codepoints().len(), 40)).join()
    let title = if title.len() == 40 { title + "..." } else { title }
    let note = list(..note.split(" \n \n").last().split(".").map(str.trim).filter(it => it != ""))

    place(
      top + left,
      dy: -6pt - 14pt, // Account for inset of block
      dx: 6pt - 14pt,
      block(fill: white, inset: 2pt)[
        = #title
      ],
    )
    place(
      top + right,
      dy: -6pt - 14pt, // Account for inset of block
      dx: 6pt,
      block(fill: white, inset: 2pt)[
        Page Number: *#page*
      ],
    )
    place(
      bottom + left,
      dy: 6pt + 14pt,
      dx: 6pt - 14pt,
      block(fill: white, inset: 2pt)[
        Word Count: *#wc*
      ],
    )
    note
  },
)

#outline()

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
