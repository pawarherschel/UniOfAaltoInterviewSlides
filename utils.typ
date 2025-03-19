// taken from catppuccin mocha
#let text-color = rgb(206, 215, 244) // text
#let alert-primary-color = rgb(247, 192, 231) // pink
#let alert-secondary-color = rgb(242, 225, 219) // rosewater
#let header-background-color = rgb(180, 190, 253) // lavender
#let slide-background-color = rgb(30, 30, 46) // base
#let focus-background-color = rgb(17, 18, 27) // crust
#let focus-text-color = rgb(48, 50, 67) // surface 0

#let default-font = "Atkinson Hyperlegible"
#let creative-font = "Nekonium"


#let filepath(file, full-file: none) = {
  let file = file.codepoints().map(c => [#sym.wj#c]).join()
  let file-at = "preview file".codepoints().map(c => [#sym.wj#c]).join()
  let full-file-at = "original file".codepoints().map(c => [#sym.wj#c]).join()
  let joiner = [~#sym.wj\@#sym.wj~]
  if full-file == none {
    text(size: 0.75em)[*#linebreak()#full-file-at#joiner#file*]
  } else {
    [
      #linebreak()
      #file-at#joiner#file
      #linebreak()
      #full-file-at#joiner#full-file
    ]
  }
}

#let figure-image(
  path: str,
  alt: none,
  fit: "contain",
  height: 1fr,
  width: auto,
  caption,
) = {
  if type(path) != type(str) {
    figure(
      image(
        path,
        alt: alt,
        fit: "contain",
        height: height,
        width: width,
      ),
      caption: [#caption #filepath(path)],
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
