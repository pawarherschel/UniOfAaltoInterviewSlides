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
    #figure-image(path: "resources/me.png")[Image of me]
  ],
  align(left + horizon)[
    #text(size: 1.8em)[
      #grid(
        rows: 1,
        columns: 2,
        column-gutter: 2%,
        image("../resources/kibty.svg", height: 3em),
        align(left + horizon)[
          #alert[Herschel Pravin Pawar]
          #linebreak()
          #text(font: alternative-font)[#link("https://sakurakat.systems")[sakurakat.systems] <links>]
        ],
      )
    ]
    #align(bottom)[
      #par(justify: true)[
        Everything you see in this presentation --- scripts, links, and images --- are a part of a Typst document available freely on GitHub under a public domain licence.
      ]
      #text(size: 0.95em)[
        #grid(
          rows: 1,
          columns: 2,
          align: left + horizon,
          column-gutter: 2%,
          image("../resources/cc.logo.svg", height: 1em), github-link(repo: "UniOfAaltoInterviewSlides"),
        )
      ]
    ]
  ],
)
