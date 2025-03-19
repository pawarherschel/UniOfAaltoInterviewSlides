#import "theme.typ": *
#import "utils.typ": *

#let primary = alert-primary-color
#let primary-light = alert-secondary-color
#let secondary = header-background-color
#let neutral-lightest = slide-background-color
#let neutral-dark = focus-background-color
#let neutral-darkest = text-color

#let title = "Portfolio Presentation"
#let subtitle = "Aalto University Game Design and Development Interview"
#let author = "Herschel Pravin Pawar"
#let date = datetime(year: 2025, month: 3, day: 19)

#set document(
  author: author,
  title: title + " - " + subtitle,
  date: date,
)
#set raw(lang: "typc")

#show: theme.with(
  aspect-ratio: "16-9",
  config-colors(
    primary: primary,
    primary-light: primary-light,
    secondary: secondary,
    neutral-lightest: neutral-lightest,
    neutral-dark: neutral-dark,
    neutral-darkest: neutral-darkest,
  ),
  config-info(
    title: title,
    subtitle: subtitle,
    author: author,
    date: date,
  ),
)

#show heading.where(depth: 1): set heading(numbering: (..n) => "=" * 1)
#show heading.where(depth: 2): set heading(numbering: (..n) => "=" * 2)
#show heading.where(depth: 3): set heading(numbering: (..n) => "=" * 3)
#show heading.where(depth: 4): set heading(numbering: (..n) => "=" * 4)

#show list: set list(marker: [-])

#show link: underline
#show link: set underline(
  stroke: (
    paint: alert-secondary-color,
    dash: "densely-dashed",
  ),
)

#set table(stroke: text-color)
#set text(font: default-font)

#set quote(block: true)
#show quote: set align(center)
#show quote: set text(font: creative-font)
#show quote: it => {
  grid(
    rows: 3,
    columns: 3,
    text(size: 3em, baseline: 0.5em)[“], [], [],
    [], text(style: "italic")[#it.body], [],
    [], [], text(size: 3em)[”],
  )
  align(right)[-- #it.attribution]
}

#let blank-slide = focus-slide(config: (freeze-slide-counter: false))[
  #text(
    font: creative-font,
    style: "italic",
    weight: "light",
    stretch: 70%,
    size: 39.3pt,
    fill: focus-text-color,
  )[
    #smallcaps[This Page Has Been Intentionally Left Blank]
  ]
]

#title-slide()

= Outline
#slide(config: (freeze-slide-counter: true))[
  #set page(footer: none)
  #align(top)[
    #outline(title: none)
  ]
]

#title-slide()

#pagebreak()
#include "slides/introduction.typ"

= Game Development Projects
#lorem(5)
== Fractured Elements
#lorem(5)
== Cosmos Conquerors
#lorem(5)
== Bevy Pong
#lorem(5)
== Godot Games
#lorem(5)

= Artsy Projects
#lorem(5)
== Krita Palette Creator
#lorem(5)
== Ray Tracing in Rust
#lorem(5)
== Kait
#lorem(5)

== Pixel Art
#block(height: 100%, width: 100%)[
  #figure-image(
    path: "resources/derpy charmander.gif",
    alt: "pixelart of charmander waving it's arms looking stupid (affectionate)",
  )[Charmander]
]

#block(height: 100%)[
  #columns(2)[
    === Rust for Lunch
    #block(height: 1fr, width: 100%, figure-image(path: "resources/preview--rfl.png")[Rust for Lunch])

    #colbreak()

    === Fractured Elements
    #block(
      height: 1fr,
      width: 100%,
      figure-image(path: "resources/preview--fractured-elements-logo.png")[Fractured Elements],
    )
  ]
]

#let aside(type: "Note", content) = rect(
  fill: focus-background-color.transparentize(20%),
  width: 100%,
  inset: (y: 10pt),
)[
  #text(size: 0.75em)[
    *#type:* #content
  ]
]

== Minecraft
#block(height: 1fr)[
  #block(height: 1fr)[
    #columns(2)[
      === Suica Inspired Card
      #block(height: 1fr, width: 100%)[
        #figure-image(path: "resources/x_journey_ticket.png")[Adult Single Journet Ticket]
      ]

      #colbreak()

      === High-Contrast Micro Icons
      #aside(type: "Limitation")[each icon could only be 7x7]
      #block(height: 1fr, width: 100%)[
        #figure-image(path: "resources/mc.png")[
          Locked and unlocked icons
        ]
      ]
    ]
  ]
]

== Vector
#block(height: 100%)[
  #columns(2)[
    === Personal Logo
    #block(height: 1fr, width: 100%)[
      #figure-image(path: "resources/kibty.svg")[sakurakat.systems]
    ]

    #colbreak()

    === Downy Mildew Advice
    #aside[The image is png and not svg as I made this in #[#link("https://krita.org/en/")[Krita] <links>] using the vector layers]
    #block(height: 1fr, width: 100%)[
      #figure-image(path: "resources/Downy Mildew Advice v2.png")[Downy Mildew Advice]
    ]
  ]
]


== Scanlation Work
#lorem(5)

= Non-game Development Projects
#lorem(5)
== VRCX Insights
#lorem(5)
== Booth Archiver
#lorem(5)
== Real-Time WebSocket Synchronization with Durable Objects
#lorem(5)
== Brainfuck Compiler with Cranelift
#lorem(5)
== NixOS
#lorem(5)

= Skills
#text(secondary)[Just a quick overview :3]
#pagebreak()

#block[
  == Natural Languages

  #single-line((
    "English",
    "Hindi",
    "Marathi",
    "Finnish (learning)",
  ))

  == Software Tools
  #single-line((
    "Photoshop",
    "Krita",
    "Godot",
    "Typst",
    "VRoid Studio",
  ))

  == Knowledge Areas
  #aside[
    I only have a surface level understanding of these things as I learnt just enough for my work requirements
  ]
  #single-line((
    "Cloudflare",
    "Linux",
    "NixOS",
    "Docker",
    "Ansible",
  ))

  == Personal Interests
  #single-line((
    "Game Development",
    "GPU Acceleration",
    "VRChat",
    "NixOS",
    "Manga & Scanlation",
  ))
]

= Conclusion
meow :3

#include "slides/appendix.typ"
