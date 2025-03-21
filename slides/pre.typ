#import "../utils.typ": *
#import "../theme.typ": *

= Hack so background images are preloaded
#{
  let cols = 13
  let images = (
    range(1, 57)
      .map(it => (
        "../resources/backgrounds/" + str(it) + ".jpg"
      ))
      .map(path => image(path))
  )

  grid(
    columns: cols,
    ..images
  )
}

= Outline
#slide(config: (freeze-slide-counter: true))[
  #set page(footer: none)
  #align(top)[
    #outline(title: none)
  ]
]

#pagebreak(weak: true)
