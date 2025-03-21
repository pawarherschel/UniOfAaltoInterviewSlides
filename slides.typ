#import "theme.typ": *
#import "utils.typ": *

#let title = "Portfolio Presentation"
#let subtitle = "Aalto University Game Design and Development Interview"
#let author = "Herschel Pravin Pawar"
#let date = datetime(year: 2025, month: 3, day: 19)

#set document(
  author: author,
  title: title + " - " + subtitle,
  date: date,
)

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

#set heading(numbering: "1.")
#show heading.where(depth: 1): set heading(
  numbering: (..n) => text(
    font: alternative-font,
    "=" * 1,
  ),
)
#show heading.where(depth: 2): set heading(
  numbering: (..n) => text(
    font: alternative-font,
    "=" * 2,
  ),
)
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
#show heading: set text(font: alternative-font, size: 1.5em)

#set quote(block: true)
#show quote.where(block: true): it => {
  set par(justify: true, linebreaks: "optimized")
  rect(width: 100%, outset: 0pt, fill: focus-background-color, inset: 1em)[
    “
    #text(it.body, hyphenate: false)
    ”\
    #h(1fr) #[---~#it.attribution]
  ]
}

#show ref: it => {
  link(it.target)[#plain-text(it.element)]
}

#set enum(tight: true)

#show math.equation: set text(font: "STIX Two Math")
#set text(size: 0.9em)

#title-slide()
= Hack so background images are preloaded
#{
  let cols = 13
  let images = (
    range(1, 45)
      .map(it => (
        "resources/backgrounds/" + str(it) + ".jpg"
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

#title-slide()

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
        image("resources/kibty.svg", height: 3em),
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
          image("resources/cc.logo.svg", height: 1em), github-link(repo: "UniOfAaltoInterviewSlides"),
        )
      ]
    ]
  ],
)

= Game Development Projects
- @gd:gg #box(width: 1fr)[#repeat(gap: 1.5pt)[.]] 2021
- @gd:fe #box(width: 1fr)[#repeat(gap: 1.5pt)[.]] July 2024
- @gd:cc #box(width: 1fr)[#repeat(gap: 1.5pt)[.]] July 2023
- @gd:bp #box(width: 1fr)[#repeat(gap: 1.5pt)[.]] October 2024

== Godot Games <gd:gg>
#{
  let godot-games = (
    (
      (
        name: "pong.png",
        caption: [Pong: It starts here],
      ),
      (
        name: "magical_marshmellow.png",
        caption: [Magical Marshmellow: made my first sfx],
      ),
      (
        name: "game_of_life.png",
        caption: [Conway's Game of Life: I #emoji.heart Maths],
      ),
      (
        name: "meme_invaders.png",
        caption: [Meme Invaders: First from scratch game],
      ),
      (
        name: "minesweeper.png",
        caption: [Minesweeper: Made the sprites],
      ),
      (
        name: "pop_the_lock.png",
        caption: [Pop The Lock: Used BFXR for SFX],
      ),
    )
      .map(it => {
        let (name, caption) = it
        (
          path: ("resources/godot/" + name),
          caption: caption,
        )
      })
      .map(it => {
        let (path, caption) = it
        figure-image(
          path: path,
          height: 1fr,
          width: 100%,
          gap: 0.2em,
          caption,
        )
      })
      .map(cell => block(
        height: 50%,
        width: 100%,
        inset: (y: 0.2em),
        align(
          center + horizon,
          cell,
        ),
      ))
  )

  set text(size: 0.6em)
  show grid.cell: set grid.cell(breakable: false)
  block(height: 100%, width: 100%)[
    #grid(
      rows: 3, columns: 3,
      row-gutter: 8pt,
      column-gutter: 8pt,
      ..godot-games
    )
  ]
}

== Fractured Elements <gd:fe>
#columns(2)[
  #block(height: 1fr, width: 100%)[
    #figure-image(path: "resources/fractured-elements/hero-switching.gif")[Main Mechanic: Continous Change]
  ]
  #colbreak()
  #block()[
    #set text(size: 0.85em)
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

#columns(2)[
  #block(height: 100%, width: 100%)[
    #figure-image(
      path: "resources/fractured-elements/player-scripts-hierarchy.svg",
    )[Player Script Graph: Low Coupling and High Cohesion]
  ]

  #colbreak()

  #block(height: 100%, width: 100%)[
    #figure-image(
      path: "resources/fractured-elements/player.svg",
    )[Player Script Hierarchy: Low Coupling and High Cohesion]
  ]
]

#pagebreak()

#columns(2)[
  #block(height: 1fr, width: 100%)[
    #figure-image(path: "resources/fractured-elements/shashank-and-me.jpg")[Shasank and Me]
  ]

  #colbreak()

  #block(height: 1fr)[
    === Key Points
    - Core Game Mechanics
    - Character Transition System
    - Attack Mechanic (thanks #[#link("https://www.terraria.org")[Terraria] <links>])
      - Hammer (melee) for Drawf
      - Bow and Arrow (ranged) for Elf

    === Technologies Used
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

== Cosmos Conquerors <gd:cc>
#columns(2)[
  #block(
    height: 1fr,
    width: 100%,
    figure-image(path: "resources/cosmos-conquerors/cosmos-conquerors.png")[Main Mechanic: Roles Reversed],
  )

  #colbreak()

  #block(height: 1fr)[
    === Key Points
    - Solo Development

    === Technologies Used
    - Godot

    === Links
    - #github-link(repo: "GMTK2023")
    - #[
        #link("https://pawarherschel.itch.io/cosmos-conquerors")[
          itch:pawarherschel:cosmos-conquerors
        ] <links>
      ]
  ]
]

#pagebreak()

=== Increasing the difficulty
#block(height: 1fr, width: 100%)[
  #columns(2)[
    #figure-image(path: "resources/cosmos-conquerors/invaders-shooting.gif")[All invaders shooting]
    #colbreak()
    #figure-image(path: "resources/cosmos-conquerors/two-invaders-shooting.gif")[Two invaders shooting]
  ]
]

#import "@preview/codly:1.2.0": *
#show: codly-init.with()

#import "@preview/codly-languages:0.1.8": *
#codly(languages: codly-languages)
#codly(
  languages: (
    rust: (name: "Rust", icon: "🦀", color: rgb("#CE412B")),
  ),
  lang-fill: none,
  zebra-fill: alert-primary-color.oklab().lighten(-40%).transparentize(80%),
)

== Bevy Pong<gd:bp>
#columns(2)[
  #set text(size: 0.75em)
  ```rust
  // path: @/src/ball.rs

  fn startup(
      mut commands: Commands,
      mut meshes: ResMut<Assets<Mesh>>,
      mut materials: ResMut<Assets<ColorMaterial>>,
  ) { /* ... */ }

  fn update(
        mut query: Query<(Entity, &mut Transform), With<Ball>>,
        mut flip: EventWriter<Flip>,
        mut create_score: EventWriter<CreateScore>,
    ) { /* ... */ }

  fn flip_handler(
    mut flips: EventReader<Flip>,
    mut query: Query<&mut Velocity, With<Ball>>,
  ) { /* ... */ }


  ```
  #colbreak()
  #codly-offset(offset: 19)
  ```rust
  fn respawn_handler(
      mut respawn: EventReader<Respawn>,
      mut query: Query<
        (&mut Transform, &mut Velocity), With<Ball>
      >,
  ) { /* ... */ }

  fn paddle_collision(
    ball: Query<
      (Entity, &Transform),
      (With<Ball>, (Without<Player>, Without<Enemy>))
    >,
    paddles: Query<
      &Transform,
      (Or<(With<Player>, With<Enemy>)>, Without<Ball>)
    >,
    mut flip: EventWriter<Flip>,
  ) { /* ... */ }
  ```
]

#pagebreak()

#columns(2)[
  #text(size: 0.75em)[
    ```rust
    impl bevy::prelude::Plugin for Pong {
      fn build(&self, app: &mut App) {
          app.add_plugins(
            DefaultPlugins.set(
              WindowPlugin { /* ... */ }
            ),
          )
          .add_systems(Startup, setup_camera)
          .add_plugins(velocity::Plugin)
          .add_plugins(player::Plugin)
          .add_plugins(resolution::Plugin)
          .add_plugins(last_mouse_position::Plugin)
          .add_plugins(ball::Plugin)
          .add_plugins(score::Plugin)
          .add_plugins(enemy::Plugin);
      }
    }
    ```
  ]

  #colbreak()
  === Key Points
  - Learn ECS and Bevy

  === Technologies Used
  - Rust
  - Bevy (Game Engine)

  === Links
  #github-link(repo: "bevy-pong")
]

#codly-disable()


= Artsy Projects
- @ap:kp #box(width:1fr, repeat(gap: 1.5pt)[.]) September 2024
- @ap:r #box(width: 1fr, repeat(gap: 1.5pt)[.]) November 2023
- @ap:k #box(width: 1fr, repeat(gap: 1.5pt)[.]) 2021
- @ap:pa #box(width: 1fr, repeat(gap: 1.5pt)[.]) { March 2024, 2024, 2023 }
// - @ap:m #box(width: 1fr, repeat(gap: 1.5pt)[.]) before 2020
// - @ap:v #box(width: 1fr, repeat(gap: 1.5pt)[.]) { before 2020, 2023 }
- @ap:s #box(width: 1fr, repeat(gap: 1.5pt)[.]) 2020


== Krita Palette Creator <ap:kp>
#columns(2)[
  #block(height: 1fr, width: 100%)[
    #set text(size: 0.8em)
    #block(width: 100%, height: 3fr)[
      #figure-image(path: "resources/krita-palette-creator/original.png")[Original Image]
    ]
    #block(width: 100%, height: 4fr)[
      #figure-image(path: "resources/krita-palette-creator/processed.png")[Quantized Image]
    ]
    #block(width: 100%, height: 1fr)[
      #figure-image(path: "resources/krita-palette-creator/palette.png")[Colors Used]
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

== Ray Tracing in Rust <ap:r>
#columns(2)[
  #block(height: 1fr)[
    #block(height: 2fr)[
      #figure-image(path: "resources/raytracing.png")[
        Ray Tracer Output
      ]
    ]
    #block(height: 1fr)[
      $
        "Resolution": &1920 * 1080\
        "Laptop CPU": &"i5-8350U (8 Cores)"\
        "Number of Runs": &10\
        "Time" ("mean" plus.minus sigma): &76.861s plus.minus 2.590s\
        "Range" (min space dots space max): &70.564s space dots space 79.588s
      $ <ap:r:benchmark>
    ]
  ]
  #colbreak()
  === Key Points
  - Learned how to make declarative macros
  - Made a custom Vec3 struct with auto-vectorization in mind
  - Used traits (interfaces) for modularity
  - Parallel Rendering

  === Technologies Used
  - Rust

  === Links
  - https://raytracing.github.io/

  - #github-link(repo: "raytracinginrust")
]

== Kait <ap:k>
#columns(2)[
  #figure-image(path: "resources/kait.png")[Original Character: Kait]
  #colbreak()
  === Key Points
  - First foray into 3d model development
  - Learned character design
  - Consistently used Heart motifs

  === Technologies Used
  - #[#link("https://vroid.com/en")[VRoid Studio] <links>]
  - Adobe Photoshop

  === Links
  - #[#link("https://r2.sakurakat.systems/kait.vrm")[VRM File] <links>]
]

== Pixel Art <ap:pa>
#block(height: 100%, width: 100%)[
  #figure-image(
    path: "resources/pixel-art/banner.gif",
  )[Pixel Art of Charmander waving it's arms looking stupid (affectionate)]
]

#pagebreak()

#block(height: 1fr, width: 100%)[
  #columns(2)[
    === Rust for Lunch
    #block(
      height: 1fr,
      width: 100%,
      figure-image(path: "resources/pixel-art/rfl.png")[Rust for Lunch Fan Art],
    )

    #colbreak()

    === Fractured Elements
    #block(
      height: 1fr,
      width: 100%,
      figure-image(path: "resources/pixel-art/fractured-elements.png")[Fractured Elements Logo],
    )
  ]
]

/*
== Minecraft <ap:m>
#block(height: 1fr)[
  #block(height: 1fr)[
    #columns(2)[
      === Suica Inspired Card
      #block(height: 1fr, width: 100%)[
        #figure-image(path: "resources/minecraft/x_journey_ticket.png")[Adult Single Journet Ticket]
      ]

      #colbreak()

      === High-Contrast Micro Icons
      #aside(type: "Limitation")[each icon could only be 7x7]
      #block(height: 1fr, width: 100%)[
        #figure-image(path: "resources/minecraft/lock-unlock.png")[
          Locked and unlocked icons
        ]
      ]
    ]
  ]
]
*/

/*
== Vector <ap:v>
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
      #figure-image(path: "resources/vector/Downy Mildew Advice v2.png")[Downy Mildew Advice]
    ]
  ]
]
*/
/*
== Vector <ap:v>
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
      #figure-image(path: "resources/vector/Downy Mildew Advice v2.png")[Downy Mildew Advice]
    ]
  ]
]
*/

== Scanlation Work <ap:s>
#block(height: 1fr, width: 100%)[
  #grid(
    columns: (1fr, 1fr, 1fr),
    figure-image(path: "resources/scanlation/original.jpg")[Original Ver.],
    figure-image(path: "resources/scanlation/product.jpg")[Edited Ver.],
    [
      #line(length: 100%, stroke: alert-primary-color)
      #v(1fr)
      #[#link("https://danbooru.donmai.us/pools/17121")[Danbooru:pools:17121] <links>]
      #v(1fr)
      #line(length: 100%, stroke: alert-primary-color)
      #v(1fr)
      Original Title: 助けた少女が吸血鬼だった医者の話。
      #v(1fr)
      #line(length: 100%, stroke: alert-primary-color)
      #v(1fr)
      Translated Title: The Story of a Doctor Who Saved a Girl Who Turned Out to Be a Vampire
      #v(1fr)
      #line(length: 100%, stroke: alert-primary-color)
      #v(1fr)
      Original By: Tsukinami Kousuke
      #v(1fr)
      Original at: #[#link("https://x.com/tuki_nami/status/1224267670037483520")[Twitter:tuki_nami ] <links>]
      #v(1fr)
      #line(length: 100%, stroke: alert-primary-color)
    ],
  )
]

#pagebreak()

=== Skills Learned
- Image Editing and Cleaning (Adobe Photoshop)
- Typesetting and Lettering
- Teamwork and Collaboration across timezones

= Non-game Development Projects
- @ngd:vi #box(width: 1fr)[#repeat(gap: 1.5pt)[.]] 2023
- @ngd:ba #box(width: 1fr)[#repeat(gap: 1.5pt)[.]] 2023
- @ngd:ws #box(width: 1fr)[#repeat(gap: 1.5pt)[.]] December 2024
- @ngd:bf #box(width: 1fr)[#repeat(gap: 1.5pt)[.]] November 2024
- @ngd:n #box(width: 1fr)[#repeat(gap: 1.5pt)[.]] October 2024

== VRCX Insights <ngd:vi>

#columns(2)[
  #figure-image(path: "resources/vrcx.png")[Preview of the image generated by the program]

  #colbreak()

  === Key Points
  - Implemented a simple (but surprisingly effective) data mining algorithm based on thresholds
  - Uses an external data source (not controlled by me)

  === Technologies Used
  - Rust
  - Tokio (Async Framework)
  - SQLite

  === Links
  - #github-link(repo: "vrcx-insights")
]
== Booth Archiver <ngd:ba>
=== Key Points
- First Rust project
- Archives wishlist from #[#link("https://booth.pm/en")[Booth] <links>]
- Compiles the data into an Excel Spreadsheet

=== Technologies Used
- Rust

=== Links
#github-link(repo: "booth_archiver")

== Real-Time WebSocket Synchronization with Durable Objects <ngd:ws>
#columns(2)[

  #text(size: 0.85em)[
    #quote(
      "Durable Objects provide a building block for stateful applications and distributed systems.

Use Durable Objects to build applications that need coordination among multiple clients, like collaborative editing tools, interactive chat, multiplayer games, and deep distributed systems, without requiring you to build serialization and coordination primitives on your own.

...omitted...

Therefore, Durable Objects enable stateful serverless applications.",
      attribution: [#link("https://developers.cloudflare.com/durable-objects/")[Cloudflare Durable Objects Documentation] <links>],
    )
  ]

  #colbreak()

  === Key Points
  - Learned networking code
  - Precursor to making online multiplayer games
  - Ease of use in browser

  === Technologies Used
  - Cloudflare Workers
  - Durable Objects
  - WebSocket
  - TypeScript

  === Links
  - #github-link(repo: "workers-durable-object-websocket-synced", preview: [GitHub:pawarherschel/workers...])
]
== Brainfuck Compiler with Cranelift <ngd:bf>
=== Key Points
- Wanted to learn how to make frontend for a language
- Used a language known for it's small compiler frontend footprint
- Used Cranelift, an alternative to LLVM written in pure rust

=== Technologies Used
- Rust
- Cranelift
=== Links
- #[#link("https://rodrigodd.github.io/2022/11/26/bf_compiler-part3.html")[Compiling Brainfuck code - Part 3: A Cranelift JIT Compiler] <link>]
- #github-link(repo: "BFCranelift")



== NixOS <ngd:n>
=== Key Points
- NixOS is a linux distro known for its declarative and reproducible system configurations
- "Flakes" help remove inconsistencies

=== Technologies Used
- Linux
- Nix

=== Links
- #github-link(repo: "nixos-config")

= Skills
Just a quick overview :3

#pagebreak()

#block(height: 1fr)[
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

#pagebreak(weak: true)

= Conclusion
#text(size: 0.8em)[
  #quote(
    "Creativity is just connecting things. When you ask creative people how they did something, they feel a little guilty because they didn't really do it, they just saw something. It seemed obvious to them after a while. That's because they were able to connect experiences they've had and synthesize new things. And the reason they were able to do that was that they've had more experiences or they have thought more about their experiences than other people. Unfortunately, that's too rare a commodity. A lot of people in our industry haven't had very diverse experiences. So they don't have enough dots to connect, and they end up with very linear solutions without a broad perspective on the problem. The broader one's understanding of the human experience, the better design we will have.",
    attribution: [Steve Jobs],
  )
]
== Why Rust?
#columns(2)[
  === Tired
  - Memory safety without garbage collection
  - Fast code, comparable to C
  - Increasing industry adoption
  - One language which truely fits all
    - Game Development: Bevy ECS
    - Rendering: WGPU
    - Embeded: Embeded Rust Ecosystem
    - Data Science
    - Systems Programming
    - Web Dev (if required)
  #colbreak()
  === Wired
  - Reduced cognitive overhead
  - Awesome tooling
  - Welcoming and inclusive community
  - Ownership and Borrowing system works perfectly with my brain
  - Functional language, but people ship with it
  - No #raw("throw exception", lang: "cpp") or #raw("nullptr", lang: "cpp") or ambigous null objects!
    - #raw("Result<T, E>", lang: "rust") and #raw("Option<T>", lang: "rust") FTW
  - No implicit conversion
]

= Appendix
#pagebreak()

== List of Images
#align(top + left)[
  #set enum(tight: true)
  #set text(size: 0.9em)
  #context {
    for figure in query(figure.where(kind: image)) {
      let caption = figure.caption
      let page = figure.location().page()

      [
        - #[
            #box(caption)
            #box(width: 1fr, repeat(gap: 1.5pt)[.])
            #text(size: 1.5em, link(figure.location())[#page])
          ]
      ]
    }
  }
]

== List of Tables

#align(top + left)[
  #set text(0.9em)
  #set enum(tight: true)
  #context {
    for figure in query(figure.where(kind: table)) {
      let caption = figure.caption
      let page = figure.location().page()

      [
        - #[
            #box(caption)
            #box(width: 1fr, repeat(gap: 1.5pt)[.])
            #text(size: 1.5em, link(figure.location())[#page])
          ]
      ]
    }
  }
]

== Table of Links

#align(top + left)[
  #context {
    let q = query(<links>)
    let bodies = q.map(l => {
      if not l.has("body") {
        text(stroke: red, size: 30pt)[SOMETHING HAS WENT WRONG!!!!! --- #l]
      } else {
        plain-text(l.body)
      }
    })
    let hyperlinks = q.map(l => {
      if not l.has("dest") {
        text(stroke: red, size: 30pt)[SOMETHING HAS WENT WRONG!!!!! --- #l]
      } else {
        l.dest
      }
    })
    let pages = q.map(l => l.location())

    let elems = bodies
      .zip(hyperlinks)
      .zip(pages)
      .map(e => {
        let ((a, b), c) = e

        (a, b, c)
      })

    show table.cell: box
    show table.cell: set box(inset: 5pt)
    show table.cell: set align(left + horizon)

    table(
      columns: 3,
      table.header(repeat: true, [pg#linebreak()no], [Accompanying Text], [Link Destination]),
      ..for (idx, (a, b, c)) in elems.enumerate() {
        ([#link(c)[#c.page()]], [#a], [#link(b)])
      },
    )
  }
]
