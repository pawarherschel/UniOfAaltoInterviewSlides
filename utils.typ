// taken from catppuccin mocha
#let text-color = rgb(206, 215, 244) // text
#let alert-primary-color = rgb(247, 192, 231) // pink
#let alert-secondary-color = rgb(242, 225, 219) // rosewater
#let header-background-color = rgb(180, 190, 253) // lavender
#let slide-background-color = rgb(30, 30, 46) // base
#let focus-background-color = rgb(17, 18, 27) // crust
#let focus-text-color = rgb(48, 50, 67) // surface 0

#let primary = alert-primary-color
#let primary-light = alert-secondary-color
#let secondary = header-background-color
#let neutral-lightest = slide-background-color
#let neutral-dark = focus-background-color
#let neutral-darkest = text-color

#let default-font = "Atkinson Hyperlegible"
#let alternative-font = "Nekonium"

#let show-rules(content) = {
  show heading.where(depth: 1): set heading(
    numbering: (..n) => text(
      font: alternative-font,
      "=" * 1,
    ),
  )
  show heading.where(depth: 2): set heading(
    numbering: (..n) => text(
      font: alternative-font,
      "=" * 2,
    ),
  )
  show heading.where(depth: 3): set heading(numbering: (..n) => "=" * 3)
  show heading.where(depth: 4): set heading(numbering: (..n) => "=" * 4)

  show list: set list(marker: [-])

  show link: underline
  show link: set underline(
    stroke: (
      paint: alert-secondary-color,
      dash: "densely-dashed",
    ),
  )

  set table(stroke: text-color)
  set text(font: default-font)
  show heading: set text(font: alternative-font, size: 1.5em)


  set quote(block: true)
  show quote.where(block: true): it => {
    set par(justify: true, linebreaks: "optimized")
    rect(width: 100%, outset: 0pt, fill: focus-background-color, inset: 1em)[
      “
      #text(it.body, hyphenate: false)
      ”\
      #h(1fr) #[---~#it.attribution]
    ]
  }

  show ref: it => {
    link(it.target)[#it.element.body]
  }

  content
}

#let filepath(file, full-file: none) = {
  let file = file.codepoints().map(c => [#sym.wj#c]).join()
  let file-at = "preview file".codepoints().map(c => [#sym.wj#c]).join()
  let full-file-at = "original file".codepoints().map(c => [#sym.wj#c]).join()
  let joiner = [~#sym.wj\@#sym.wj/]
  if full-file == none {
    text(size: 0.75em)[*#linebreak()#full-file-at#sym.zws#joiner#file*]
  } else {
    [
      #linebreak()
      #file-at#sym.zws#joiner#file
      #linebreak()
      #full-file-at#sym.zws#joiner#full-file
    ]
  }
}

#let figure-image(
  path: str,
  fit: "contain",
  height: 1fr,
  width: auto,
  gap: 0.65em,
  caption,
) = {
  if type(path) != type(str) {
    let path = path.replace("../", "")
    figure(
      image(
        path,
        fit: "contain",
        height: height,
        width: width,
      ),
      caption: [#caption #filepath(path)],
      gap: gap,
    )
  }
}

#let single-line(entries) = {
  for (nth, entry) in entries.enumerate() {
    [#box(width: 1fr)[#(nth + 1). #entry]]
  }
}

#let bg-img-ctr = counter("background-image")

#let get-next-bg-img() = {
  bg-img-ctr.step()
  context {
    let path = (
      "resources/backgrounds/" + str(bg-img-ctr.get().at(0)) + ".jpg"
    )

    image(path, fit: "cover", width: 100%)
  }
}

#let aside(type: "Note", content) = rect(
  fill: focus-background-color.transparentize(20%).oklch().lighten(10%),
  width: 100%,
  inset: (y: 10pt),
)[
  #text(size: 0.75em)[
    *#type:* #content
  ]
]

#let github-link(owner: "pawarherschel", repo: str) = [
  #link("https://github.com/" + owner + "/" + repo)[
    GitHub:#owner/#repo
  ] <links>
]


#let blank-slide = {
  import "theme.typ": focus-slide
  focus-slide(config: (freeze-slide-counter: false))[
    #text(
      font: alternative-font,
      style: "italic",
      weight: "light",
      stretch: 70%,
      size: 39.3pt,
      fill: focus-text-color,
    )[
      #smallcaps[This Page Has Been Intentionally Left Blank]
    ]
  ]
}
