slides:
  tinymist preview --preview-mode slide slides.typ --font-path "D:\Sync\Projects\Assets\Fonts"

export:
  typst compile --font-path "D:\Sync\Projects\Assets\Fonts" slides.typ "slides-svg/page-{0p}-of-{t}.svg"
  typst compile --font-path "D:\Sync\Projects\Assets\Fonts" slides.typ "slides-png/page-{0p}-of-{t}.png" --ppi 1200
