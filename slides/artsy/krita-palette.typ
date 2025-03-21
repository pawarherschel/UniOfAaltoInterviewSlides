#import "../../utils.typ": *

== Krita Palette Creator <ap:kp>
#columns(2)[
  #block(height: 1fr, width: 100%)[
    #set text(size: 0.8em)
    #block(width: 100%, height: 3fr)[
      #figure-image(path: "../../resources/krita-palette-creator/original.png")[Original Image]
    ]
    #block(width: 100%, height: 4fr)[
      #figure-image(path: "../../resources/krita-palette-creator/processed.png")[Quantized Image]
    ]
    #block(width: 100%, height: 1fr)[
      #figure-image(path: "../../resources/krita-palette-creator/palette.png")[Colors Used]
    ]
  ]

  #colbreak()
  === Key Points
  - Implemented color quantization by using median cut algorithm

  === Technologies Used
  - Rust

  === Links
  - #[
      #link("https://rosettacode.org/wiki/Color_quantization#Rust")[
        Rosetta Code Page
      ] <links>
    ]
  - #wikipedia-link(page: "Median_cut")[Median Cut]
  - #wikipedia-link(page: "Color_quantization")[Color Quantization]
  - #github-link(repo: "krita-palette-creator")
]
