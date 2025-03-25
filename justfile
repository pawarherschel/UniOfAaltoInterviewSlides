default: slides notes

all: slides notes export

font-path := '--font-path "D:\Sync\Projects\Assets\Fonts"'

pdfpc:
  typst query --root . ./slides.typ --field value --one "<pdfpc-file>" > slides.pdfpc

slides:
  typst compile slides.typ {{font-path}}

notes: pdfpc
  typst compile notes.typ

preview:
  tinymist preview --preview-mode slide slides.typ {{font-path}}

export:
  typst compile {{font-path}} slides.typ "slides-svg/page-{0p}-of-{t}.svg"
  typst compile {{font-path}} slides.typ "slides-png/page-{0p}-of-{t}.png" --ppi 600
