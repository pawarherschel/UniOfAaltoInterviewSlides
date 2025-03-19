#import "../theme.typ": *
#import "../utils.typ": *

#show: appendix
#bg-img-ctr.update(0)

= Appendix
#focus-slide(config: (freeze-slide-counter: false))[
  *The page numbers refer to the _PDF_ page numbers and not the Slide page numbers*
]
== List of Images
#align(top + left)[
  #context {
    for figure in query(figure.where(kind: image)) {
      let caption = figure.caption
      let page = figure.location().page()

      text(size: 0.9em)[- #caption #h(1fr) #link(figure.location())[#page]]
    }
  }
]

== List of Tables

#align(top + left)[
  #context {
    for figure in query(figure.where(kind: table)) {
      let caption = figure.caption
      let page = figure.location().page()

      text(size: 0.9em)[- #caption #h(1fr) #link(figure.location())[#page]]
    }
  }
]

== Table of Links

// taken from: https://sitandr.github.io/typst-examples-book/book/typstonomicon/extract_plain_text.html
// original author: ntjess
#let stringify-by-func(it) = {
  let func = it.func()
  return if func in (parbreak, pagebreak, linebreak) {
    "\n"
  } else if func == smartquote {
    if it.double { "\"" } else { "'" } // "
  } else if it.fields() == (:) {
    // a fieldless element is either specially represented (and caught earlier) or doesn't have text
    ""
  } else {
    panic("Not sure how to handle type `" + repr(func) + "`")
  }
}

#let plain-text(it) = {
  return if type(it) == str {
    it
  } else if it == [ ] {
    " "
  } else if it.has("children") {
    it.children.map(plain-text).join()
  } else if it.has("body") {
    plain-text(it.body)
  } else if it.has("text") {
    if type(it.text) == str {
      it.text
    } else {
      plain-text(it.text)
    }
  } else {
    // remove this to ignore all other non-text elements
    stringify-by-func(it)
  }
}

#align(top + left)[
  #context {
    let q = query(<links>)
    let bodies = q.map(l => {
      if not l.has("body") {
        text(stroke: red, size: 30pt)[SOMETHING HAS WENT WRONG!!!!! --- #l]
      } else {
        plain-text(l.body)
      }
    })
    let hyperlinks = q.map(l => {
      if not l.has("dest") {
        text(stroke: red, size: 30pt)[SOMETHING HAS WENT WRONG!!!!! --- #l]
      } else {
        l.dest
      }
    })
    let pages = q.map(l => l.location())

    let elems = bodies
      .zip(hyperlinks)
      .zip(pages)
      .map(e => {
        let ((a, b), c) = e

        (a, b, c)
      })

    show table.cell: box
    show table.cell: set box(inset: 5pt)
    show table.cell: set align(left + horizon)

    table(
      columns: 3,
      table.header(repeat: true, [pg#linebreak()no], [Accompanying Text], [Link Destination]),
      ..for (idx, (a, b, c)) in elems.enumerate() {
        ([#link(c)[#c.page()]], [#a], [#link(b)])
      },
    )
  }
]
