#import "../../utils.typ": *
#import "../../theme.typ": slide

== Fractured Elements <gd:fe>

#columns(2)[
  #block(height: 1fr, width: 100%)[
    #set text(size: 0.85em)
    #figure-image(path: "resources/fractured-elements/hero-switching.gif")[Main Mechanic: Continous Change]
  ]
  #colbreak()
  #block()[
    #set text(size: 0.7em)
    #quote(
      "Visually nice platformer game with a pixel art approach and switching characters that allow either melee or ranged attacks. Multiple levels make it interesting and force the player to master their jumping and attacking skills. There is a final boss for the finale. One improvement I would suggest is that I was unsure what caused me to change between the characters - I was not sure if it was timed, depending on where I was in the level or a button press. Well done to all involved in the game and the hard work you put into it!",
      attribution: [Anonymous judge feedback],
    )
    #table(
      columns: 4,
      "Criteria", "Rank", "Score*", "Raw Score",
      "Gameplay", "#2", "3.286", "3.600",
      "Presentation", "#2", "3.469", "3.800",
      "Creativity", "#3", "2.739", "3.000",
      "Enjoyment", "#3", "2.921", "3.200",
    )
  ]
]
#pagebreak()

#columns(2)[
  #block(height: 100%, width: 100%)[
    #set text(size: 0.85em)
    #figure-image(
      path: "resources/fractured-elements/player-scripts-hierarchy.svg",
    )[Player Script Graph: Low Coupling and High Cohesion]
  ]

  #colbreak()

  #block(height: 100%, width: 100%)[
    #set text(size: 0.85em)
    #figure-image(
      path: "resources/fractured-elements/player.svg",
    )[Player Script Hierarchy: Low Coupling and High Cohesion]
  ]
]

#pagebreak()

#columns(2)[
  #block(height: 1fr, width: 100%)[
    #set text(size: 0.85em)
    #figure-image(path: "resources/fractured-elements/shashank-and-me.jpg")[Shasank and Me]
  ]

  #colbreak()

  #block(height: 1fr)[
    === Key Contributions
    - Core Game Mechanics
    - Character Transition System
    - Attack Mechanic (thanks #[#link("https://www.terraria.org")[Terraria] <links>])
      - Hammer (melee) for Drawf
      - Bow and Arrow (ranged) for Elf

    === Technologies
    - Unity

    === Links
    - #github-link(repo: "CovUniGJ2024")
    - #[
        #link("https://pawarherschel.itch.io/fractured-elements")[
          itch:pawarherschel:fractured-elements
        ] <links>
      ]
  ]
]
