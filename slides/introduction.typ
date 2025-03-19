#import "../theme.typ": *
#import "../utils.typ": *

= Introduction

#pagebreak()

#grid(
  columns: 2,
  rows: 1,
  align: center,
  column-gutter: 2%,
  block(height: 1fr)[
    #figure-image(
      path: "resources/me.png",
      alt: "image of Herschel Pravin Pawar",
    )[Image of me]
  ],
  align(left + horizon)[
    #text(size: 27pt)[
      #grid(
        rows: 1,
        columns: 2,
        column-gutter: 2%,
        image("../resources/kibty.svg", height: 3em),
        align(left + horizon)[
          #alert[Herschel Pravin Pawar]
          #linebreak()
          #text(font: creative-font)[#link("https://sakurakat.systems")[sakurakat.systems] <links>]
        ],
      )
    ]
    #align(bottom)[
      #text(size: 1em)[
        #par(justify: true)[
          #text(size: 0.695em)[
            Everything you see in this presentation --- scripts, links, and images --- are a part of a Typst document available freely on GitHub under a public domain licence.
          ]
        ]
        #grid(
          rows: 1,
          columns: 2,
          align: left + horizon,
          column-gutter: 2%,
          image("../resources/cc.logo.svg", height: 1em),
          text(size: 0.8em)[
            #[#link("https://github.com/pawarherschel/UniOfAaltoInterviewSlides")[
                GitHub:pawarherschel/UniOfAaltoInterviewSlides
              ] <links>]
          ],
        )
      ]
    ]
  ],
)
