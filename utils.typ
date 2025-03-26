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
#let alternative-font = "JetBrainsMono NF"

#let bg = state("bg", false)

// src: https://sitandr.github.io/typst-examples-book/book/typstonomicon/extract_plain_text.html
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
  return if it == none { "" } else if type(it) == str {
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

#let filepath(file, full-file: none) = {
  let file = file.codepoints().map(c => [#sym.wj#c]).join()
  let file-at = "preview file".codepoints().map(c => [#sym.wj#c]).join()
  let full-file-at = "original file".codepoints().map(c => [#sym.wj#c]).join()
  let joiner = [~#sym.wj\@#sym.wj/]
  set par(justify: false)
  if full-file == none {
    text(size: 0.75em)[*#full-file-at#sym.zws#joiner#file*]
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
  alt: none,
  caption,
) = {
  if type(path) != type(str) {
    let path = path.replace("../", "")
    let path = path.replace("./", "")
    figure(
      image(
        path,
        fit: "contain",
        height: height,
        width: width,
        ..if alt != none { (alt: alt) },
      ),
      caption: [#caption#filepath(path)],
      gap: gap,
    )
    context if not bg.get() {
      pdf.embed(
        path,
        relationship: "data",
        mime-type: if path.ends-with("png") {
          "image/png"
        } else if path.ends-with("gif") {
          "image/gif"
        } else if path.ends-with("jpeg") or path.ends-with("jpg") {
          "image/jpeg"
        } else if path.ends-with("svg") {
          "image/svg+xml"
        } else { panic("Unknown file type" + path) },
        description: "caption: "
          + plain-text(caption)
          + " filepath: "
          + path
          + if alt != none { " has alt text: " + alt },
      )
    }
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

    align(top + left, image(path, fit: "cover", width: 100%))
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

#let github-link(owner: "pawarherschel", repo: str, preview: none, first-commit: datetime) = {
  assert(type(repo) != type(str), message: "enter the repo name dumbass")
  assert(type(first-commit) == datetime)
  [#[#link(
    "https://github.com/" + owner + "/" + repo,
    if preview == none [GitHub:#owner#sym.slash#repo] else [#preview],
  )<links>]#linebreak()| First Commit: #first-commit.display()]
}

#let wikipedia-link(page: str, display) = {
  assert(type(page) == str)
  [#link("https://en.wikipedia.org/wiki/" + page)[Wikipedia:#page $==>$ #display]<links>]
}

#let youtube-link(title: str, creator: str, video-id: str) = {
  [#link("https://www.youtube.com/watch?v=" + video-id)[YouTube:#video-id $==>$ #title $<==$ #creator]<links>]
}

#let steam-link(id: str, title) = {
  [#link("https://store.steampowered.com/app/" + id)[Steam:#id $==>$ #title]<links>]
}

#let itch-io-link(username: "pawarherschel", id: str, title) = {
  [#link("https://" + username + ".itch.io/" + id)[itch:#username:#id $==>$ #title]<links>]
}
