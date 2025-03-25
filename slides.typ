#import "theme.typ": *
#import "utils.typ": *

#let title = "Portfolio Presentation"
#let subtitle = "Aalto University Game Design and Development Interview"
#let author = "Herschel Pravin Pawar"
#let date = datetime(year: 2025, month: 3, day: 19)
#bg.update(true)

#let quick-links = (
  [@outline],
  [@introduction],
  [@gd],
  [@ap],
  [@ngd],
  [@s],
  [@c],
)

#set document(
  author: author,
  title: title + " - " + subtitle,
  date: date,
)

#pdf.embed(
  "slides.typ",
  relationship: "source",
  mime-type: "text/typst",
)

#pdf.embed(
  "utils.typ",
  relationship: "source",
  mime-type: "text/typst",
)

#pdf.embed(
  "theme.typ",
  relationship: "source",
  mime-type: "text/typst",
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
  footer: [Jump: #quick-links.join(" ")],
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

#title-slide()
= Hack so background images are preloaded
#{
  let cols = 13
  let images = (
    range(1, 45)
      .map(it => (
        "resources/backgrounds/" + str(it) + ".jpg"
      ))
      .map(path => {
        image(path)
        pdf.embed(
          path,
          mime-type: "image/jpeg",
          relationship: "data",
        )
      })
  )

  grid(
    columns: cols,
    ..images
  )
}

= Outline <outline>
#slide(config: (freeze-slide-counter: true))[
  #set page(footer: none)
  #align(top)[
    #outline(title: none)
  ]
]

#pagebreak(weak: true)

#title-slide()

= Introduction <introduction>
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
          image("resources/cc.logo.svg", height: 1em),
          github-link(
            repo: "UniOfAaltoInterviewSlides",
            first-commit: datetime(day: 19, month: 3, year: 2025),
          ),
        )
      ]
    ]
  ],
)

= Game Development Projects <gd>
- @gd:gg #box(width: 1fr)[#repeat(gap: 1.5pt)[.]] 2021
- @gd:fe #box(width: 1fr)[#repeat(gap: 1.5pt)[.]] July 2024
- @gd:cc #box(width: 1fr)[#repeat(gap: 1.5pt)[.]] July 2023
- @gd:bp #box(width: 1fr)[#repeat(gap: 1.5pt)[.]] October 2024
- @gd:lo #box(width: 1fr)[#repeat(gap: 1.5pt)[.]] November 2024

== Godot Games <gd:gg>
#pdfpc.speaker-note("The first proper game engine I used was godot.
  I tried to do something different everytime I made a game.
  + Pong: learned the game engine
  + Magical Marshmellow: Used audacity to record and edit a sound effect, drew all the sprites
  + Conway's Game of Life: Implemented the algorithm by copying from wikipedia
  + Meme Invaders: Made the whole game by myself without watching tutorial
  + Minesweeper: Implemented the flood fill algorithm without knowing the flood fill algorithm
  + Pop The Lock: Used Krita's Vector layers for first time")
#{
  let godot-games = (
    (
      (
        name: "pong.png",
        caption: [Pong: It starts here],
      ),
      (
        name: "magical_marshmellow.png",
        caption: [Magical Marshmellow: Drew all the sprites, and made the "boing" SFX],
      ),
      (
        name: "game_of_life.png",
        caption: [Conway's Game of Life: Implemented #wikipedia-link(page: "Conway%27s_Game_of_Life")[Conway's Game of Life]],
      ),
      (
        name: "meme_invaders.png",
        caption: [Meme Invaders: First from scratch game],
      ),
      (
        name: "minesweeper.png",
        caption: [Minesweeper: Wrote all the logic by myself (#wikipedia-link(page: "Flood_fill")[Flood fill])],
      ),
      (
        name: "pop_the_lock.png",
        caption: [Pop The Lock: Made all the assets\
          using Krita's Vector Layers],
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
#speaker-note[
  Originally, the game was supposed to have 4 characters but due to time constrains, we weren't able to do it.\
  The judge feedback is pretty positive, they mentioned that they were unsure about what caused them to change between the characters.\
  My partner and I had decided that the character changing mechanic was going to be explained during the presentation, but we weren't given the chance to show our presentation.
]
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

#speaker-note[
  My biggest contribution to the game was the changing character mechanic.
  My aim was to have low coupling and high cohesion.
  Lets call the outermost shell, the character and the switching character, that is, the dwarf, and the elf, sub-characters. Coming from Godot I thought it would be easy, just create signals and connect them, and run function at a certain animation frame to spawn projectile. But, Unity was less friendly than I expected.

  The `PlayerController` script handled the movement, switching between the sub-characters, and sending "signals" for the animation, and attack to the sub-character.
  I wanted to use Unity `events`, however, I decided that it was more important to complete the game, than to do it the proper way.
]
#columns(2)[
  #block(height: 100%, width: 100%)[
    #figure-image(path: "resources/fractured-elements/player-scripts-hierarchy.svg")[Player Script Graph]
  ]

  #colbreak()

  #block(height: 100%, width: 100%)[
    #figure-image(path: "resources/fractured-elements/player.svg")[Player Script Hierarchy]
  ]
]

#pagebreak()

#speaker-note[
  Years ago I heard somewhere about how Terraria handles weapons.

  They spawn a projectile with an initial position, and an initial speed.
  Everything else was handled by the projectile script. So, thats exactly how I did it.

  Another problem I encountered was spawning the attack projectiles at the correct frame during animation. I ended up using a janky way to detect if the animation time has reached a certain percentage and then spawning the projectile.
]
#columns(2)[
  #block(height: 1fr, width: 100%)[
    #figure-image(path: "resources/fractured-elements/shashank-and-me.jpg")[Shasank and Me]
  ]

  #colbreak()

  #block(height: 1fr)[
    === Key Points
    - Core Game Mechanics
    - Character Transition System
    - Attack Mechanic (thanks #[#link("https://www.terraria.org")[Terraria]<links>])
      - Hammer (melee) for Dawrf
      - Bow and Arrow (ranged) for Elf

    === Technologies Used
    - Unity

    === Links
    - #github-link(
        repo: "CovUniGJ2024",
        first-commit: datetime(day: 22, month: 7, year: 2024),
      )
    - #itch-io-link(id: "fractured-elements")[Fractured Elements]
  ]
]

== Cosmos Conquerors <gd:cc>
#speaker-note[
  Cosmos Conquerorswas my first game jam game. In the game, you are the swarm of enemies, and your objective is to survive against ever more powerful heros.

  I had quite a few ideas but I decided to first make the core game and then focus on the aesthetics and tweaks.

  I wanted to have a procedurally generated background but due to health problems I was unable to complete it.
]
#columns(2)[
  #text(size: 0.7em)[
    #block(
      height: 2fr,
      width: 100%,
      figure-image(path: "resources/cosmos-conquerors/screenshot.png")[Main Mechanic: Roles Reversed],
    )
    #block(
      height: 1fr,
      width: 100%,
      figure-image(
        path: "resources/cosmos-conquerors/comment 1.png",
        alt: "Cool concept and you made it work! More enemies and a better control of the ships and what ship would shoot would be nice",
      )[Comment by "Gabriel Toschi"],
    )
    #block(
      height: 1fr,
      width: 100%,
      figure-image(
        path: "resources/cosmos-conquerors/comment 2.png",
        alt: "Interesting concept! More variations in the future would be great!",
      )[Comment by "Zimizeh"],
    )
  ]

  #colbreak()

  #block(height: 1fr)[

    === Key Points
    - Solo Development

    === Technologies Used
    - Godot

    === Links
    - #github-link(
        repo: "GMTK2023",
        first-commit: datetime(day: 8, month: 7, year: 2023),
      )
    - #itch-io-link(id: "cosmos-conquerors")[Cosmos Conquerors]
  ]
]

#pagebreak()

=== Spicing things up
#speaker-note[
  The twist was that you couldn't control which invader shoots when you press spacebar. The bullet was shot from a random invader. This made it so more invaders equals more health, but you're less likely to shoot from the invader you want.

  The hero gains more and more speed everytime it dies, eventually, it will catch up to the invaders and kill them all.
]
#block(height: 1fr, width: 100%)[
  #columns(2)[
    #figure-image(path: "resources/cosmos-conquerors/invaders-shooting.gif")[All invaders shooting]
    #colbreak()
    #figure-image(path: "resources/cosmos-conquerors/two-invaders-shooting.gif")[Two invaders shooting]
  ]
]


== Bevy Pong<gd:bp>
#speaker-note[
  Bevy is a game engine in rust which uses ECS architecture. I am interested in high performance compute, so, I wanted to learn how to use ECS. I had also heard good things about bevy, like, how its great at #quote(
    "progressive disclosure of complexity",
    attribution: "Chris Biscardi",
    block: false
  ). Like you can replace the renderer (check out: Tiny Glade). There's also some render graph thing going on but I don't know what it is.

  Bevy uses WGPU, an implementation of WebGPU standard in rust. I find WGSL easier to read.
]
#columns(2)[
  #set text(size: 0.75em)
  ```rust
  // taken from: @/src/ball.rs

  fn startup(
      mut commands: Commands,
      mut meshes: ResMut<Assets<Mesh>>,
      mut materials: ResMut<Assets<ColorMaterial>>,
  ) { /* .. omit .. */ }

  fn update(
        mut query: Query<(Entity, &mut Transform), With<Ball>>,
        mut flip: EventWriter<Flip>,
        mut create_score: EventWriter<CreateScore>,
    ) { /* .. omit .. */ }

  fn flip_handler(
    mut flips: EventReader<Flip>,
    mut query: Query<&mut Velocity, With<Ball>>,
  ) { /* .. omit .. */ }


  ```<gd:bp:code:1>
  #colbreak()
  #codly(offset-from: <gd:bp:code:1>)
  ```rust
  fn respawn_handler(
      mut respawn: EventReader<Respawn>,
      mut query: Query<
        (&mut Transform, &mut Velocity), With<Ball>
      >,
  ) { /* .. omit .. */ }

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
  ) { /* .. omit .. */ }
  ```<gd:bp:code:2>
]

#pagebreak()

#speaker-note[
  I originally wanted to add online multiplayer via websockets but while building proof of concept for the websocket, I encountered problems with the websocket library and I don't have the skills to troubleshoot it. I will revisit and continue it later.

  Also, it took me 3 tries to learn how to use ECS.
  I also want to use bevy to write compute shaders in WGSL.

  Godot's signals instantly clicked with me because of how they decouple scripts. Bevy's #raw("EventWriter<T>", lang: "rust") and #raw("EventReader<T>", lang: "rust") do the same for me.
]
#columns(2)[
  #text(size: 0.75em)[
    ```rust
    // taken from: @/src/lib.rs

    impl bevy::prelude::Plugin for Pong {
      fn build(&self, app: &mut App) {
          app.add_plugins(
            DefaultPlugins.set(
              WindowPlugin { /* .. omit .. */ }
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
    ```<gd:bp:code:3>
  ]

  #colbreak()
  === Key Points
  - Learn ECS and Bevy

  === Technologies Used
  - Rust
  - Bevy (Game Engine)

  === Links
  - #github-link(
      repo: "bevy-pong",
      first-commit: datetime(day: 26, month: 10, year: 2024),
    )
  - #youtube-link(
      video-id: "CnoDOc6ML0Y",
      title: "Chris Biscardi - Bevy: A case study in ergonomic Rust",
      creator: "Rust Nation UK",
    )
  - #steam-link(id: "2198150")[Tiny Glade]
]

== Learn OpenGL<gd:lo>
#speaker-note[
  Coming from rust, where I rely a lot on tools like Clippy to reduce cognitive load, catch errors, use idiomatic code, dodge potential issues, etc, the tooling for C++ was not helpful at all. I tried to use CLang's lsp and CLion IDE, but they weren't anywhere as helpful as Clippy. I also couldn't explore and learn the way I do in Rust, by reading the documentation by hovering on the functions.
]
#columns(2)[
  #figure-image(path: "resources/learn-opengl.png")[OpenGL Renderer Progress]
  #colbreak()
  === Key Points
  - Tried to use modern C++
    - Failed because I'm on Windows
    - Modern C++ didn't feel cohesive
  - Reached the #[#link("https://learnopengl.com/Getting-started/Transformations")[Transformations Chapter]<links>]

  === Technologies Used
  - C++
  - OpenGL

  === Links
  - #github-link(
      repo: "learn-opengl",
      first-commit: datetime(day: 1, month: 11, year: 2024),
    )
  - #[#link("https://learnopengl.com")[Learn OpenGL Book]<links>]
]

= Artsy Projects <ap>
- @ap:kp #box(width:1fr, repeat(gap: 1.5pt)[.]) September 2024
- @ap:r #box(width: 1fr, repeat(gap: 1.5pt)[.]) November 2023
- @ap:k #box(width: 1fr, repeat(gap: 1.5pt)[.]) 2021
- @ap:pa #box(width: 1fr, repeat(gap: 1.5pt)[.]) { 2023, 2024 }
// - @ap:m #box(width: 1fr, repeat(gap: 1.5pt)[.]) before 2020
// - @ap:v #box(width: 1fr, repeat(gap: 1.5pt)[.]) { before 2020, 2023 }
- @ap:s #box(width: 1fr, repeat(gap: 1.5pt)[.]) 2020

== Krita Palette Creator <ap:kp>
#speaker-note[
  I made this project as I often wanted to pick colors from an image, but due to the shading and jpeg compression artifacts, it was hard to choose a representative color. I checked if Rosetta Code had the algorithm, and it didn't. I checked other languages, and Java was the most readable one, so I ported the java code almost line to line, and then contributed the code.

  I wanted a program which helped me pick distinct colors, while reducing the number of actual colors which are similar. Turns out, the algorithm isn't suitable for my usecase, but I still manage to use it.
]
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
  - Implemented color quantization by using median cut algorithm (Ported the Java code)

  === Technologies Used
  - Rust

  === Links
  - #[#link("https://rosettacode.org/wiki/Color_quantization#Rust")[Rosetta Code Page] <links>]
  - #wikipedia-link(page: "Median_cut")[Median Cut]
  - #wikipedia-link(page: "Color_quantization")[Color Quantization]
  - #github-link(
      repo: "krita-palette-creator",
      first-commit: datetime(day: 16, month: 12, year: 2024),
    )
]

== Ray Tracing in Rust <ap:r>
#speaker-note[
  One of my favorite type of content on youtube is some person optimizing a single aspect of a program until it's limit. I used this project as a testbed to write efficient code.

  I was following a tutorial written in some old version of rust. I used my knowledge of rust to write it in modern rust while trying my best to use good and idiomatic rust practices.

  I was a fool back then and didn't write down the link to the book I was following, so, I can only put the legendary book by Peter Shirley.
]
#columns(2)[
  #block(height: 1fr)[
    #block(height: 2fr)[
      #figure-image(path: "resources/raytracing.png")[Ray Tracer Output]
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
  - #github-link(
      repo: "raytracinginrust",
      first-commit: datetime(day: 23, month: 11, year: 2023),
    )
]

== Kait <ap:k>
#speaker-note[
  I made Kait to use as my vtuber persona. My aim was to make a simple countryside girl inspired by cottagecore who has a lot of heart motifs. I made or edited the textures in photoshop.

  While I ultimately didn't stream much, I'm still proud of the character I made.
]
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
#speaker-note[
  I made this adorable idiot while learning pixel art from a course I bought
]
#columns(2)[
  #block(height: 1fr, width: 100%)[
    #figure-image(
      path: "resources/pixel-art/banner.gif",
      scaling: "pixelated",
    )[Pixel Art of Charmander waving it's arms looking stupid (affectionate)]
  ]
  #colbreak()

  #block(height: 1fr, width: 100%)[
    #figure-image(
      path: "resources/pixel-art/charmander-original.gif",
    )[#[#link("https://www.omocat-blog.com/post/24438605155/pikachu-needed-friends")[original source: omocat's tumblr blog: pikachu needed friends]<links>]]
  ]

]
#pagebreak()

#speaker-note[
  The pixel art on left is for rust's mascot ferris the crab obtaining a sandwich. It was made for a monthly online rust meetup. I was planning speak in the meetup but the last meetup was december of last year.

  The pixel art on right is the logo I made for the Coventry University Summer School Game Jam. It's the elemental powers for the characters. If I wanted to continue the game, I would add the element for the other powers when I add them to the game.
]
#block(height: 1fr, width: 100%)[
  #columns(2)[
    === Rust for Lunch
    #block(
      height: 1fr,
      width: 100%,
      figure-image(
        path: "resources/pixel-art/rfl.png",
        scaling: "pixelated",
      )[Rust for Lunch Fan Art],
    )

    #colbreak()

    === Fractured Elements
    #block(
      height: 1fr,
      width: 100%,
      figure-image(
        path: "resources/pixel-art/fractured-elements.png",
        scaling: "pixelated",
      )[Fractured Elements Logo],
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
#speaker-note[
  Scanlation is the act of fan-made scanning, translation, and editing of comics from a language into another language

  I have read a lot of manga, and I was always curious about how hard it would be to clean and typeset manga pages. I did it to practice my editing and typesetting skills.

  Here you see an example of my work.
]
#block(height: 1fr, width: 100%)[
  #grid(
    columns: (2fr, auto, 2fr, 1fr),
    {
      set text(size: 0.9em)
      figure-image(path: "resources/scanlation/original.jpg")[Original Ver.]
    },
    $|=>$,
    {
      set text(size: 0.9em)
      figure-image(path: "resources/scanlation/product.jpg")[Edited Ver.]
    },
    [
      #line(length: 100%, stroke: alert-primary-color)
      #v(1fr)
      #[#link("https://danbooru.donmai.us/pools/17121")[Danbooru:pools:17121]<links>]
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
      Original at: #[#link("https://x.com/tuki_nami/status/1224267670037483520")[Twitter:tuki_nami]<links>]
      #v(1fr)
      #line(length: 100%, stroke: alert-primary-color)
    ],
  )
]

#pagebreak()

#speaker-note[
  I cannot do the whole scanlation process. I would need to build up good will so artists don't mind me processing their art, learn and practice Japanese, learn about Japanese culture so I can translate more accurately, and then finally I can do what I originally wanted to do, that is, practice my editing and typesetting skills.

  So, I joined the "Danke fürs Lesen" scanlation group.
  I was able to work with people across timezones and be part of an inclusive community.
]
=== Skills Learned
- Image Editing and Cleaning (Adobe Photoshop)
- Typesetting and Lettering
- Teamwork and Collaboration across timezones

= Non-game Development Projects <ngd>
- @ngd:vi #box(width: 1fr)[#repeat(gap: 1.5pt)[.]] 2023
- @ngd:ba #box(width: 1fr)[#repeat(gap: 1.5pt)[.]] 2023
- @ngd:ws #box(width: 1fr)[#repeat(gap: 1.5pt)[.]] December 2024
// - @ngd:bf #box(width: 1fr)[#repeat(gap: 1.5pt)[.]] November 2024
// - @ngd:n #box(width: 1fr)[#repeat(gap: 1.5pt)[.]] October 2024

== VRCX Insights <ngd:vi>
#speaker-note[
  There's a concept called six degrees of separation which says that you are connected to any other person on earth by at most six people. One of my friends kept saying that "I know everyone" since I kept bumping into her in unexpected friend circles.
  So, I wanted a tool to see how people are connected directly and indirectly when I'm not part of the link. For example, if I know three people: X, Y, and Z, I wanted to see if X and Z are connected through Y. One of the other goals was to identify social circles within the community.
  It uses frequency of joining and leaving a room to guess if someone is connected to another person. If people are often in the same room then it's highly likely they're connected.

  For a real life example, I had classmates Manish, and Aryan, and underclassmates Divyesh, and Tejas.
  Divyesh is the same person who is in the credits for most of my slides.
  Aryan, Manish, Tejas, and I were part of the student association. Manish knew Aryan, Aryan knew Tejas, and Tejas knew Divyesh. So, the indirect chain is Manish -> Aryan -> Tejas -> Divyesh.
]
#columns(2)[
  #figure-image(path: "resources/vrcx.png")[Preview of the image generated by the program]

  #colbreak()

  === Key Points
  - Implemented a simple (but surprisingly effective) data mining algorithm based on thresholds
  - Uses an external data source

  === Technologies Used
  #grid(
    columns: 3,
    column-gutter: 1fr,
    [- Rust], [- SQLite], [- Tokio (Async Framework)],
  )

  === Links
  - #github-link(
      repo: "vrcx-insights",
      first-commit: datetime(day: 19, month: 11, year: 2023),
    )
  - #wikipedia-link(page: "Six_degrees_of_separation")[Six degrees of separation]
]

== Booth Archiver <ngd:ba>
#speaker-note[
  I made this project to learn rust by creating a practical project. It uses all the available threads. I learnt how to use AMD uPerf and flamegraph to find out the bottleneck. I also had to learn how to use a debugger for this project. I eventually found out that I keep running into deadlock situations while consolidating data from the threads
]
=== Key Points
- First Rust project
- Archives wishlist from #[#link("https://booth.pm/en")[Booth]<links>]
- Compiles the data into an Excel Spreadsheet

=== Technologies Used
- Rust

=== Links
#github-link(
  repo: "booth_archiver",
  first-commit: datetime(day: 28, month: 7, year: 2023),
)

== Real-Time WebSocket Synchronization with Durable Objects <ngd:ws>
#speaker-note[
  Very dumb name, I know. I just used this project to learn how to use websockets in their quote-on-quote native environment, that is, the web browser.

  I chose websockets instead of UDP as it's easier to use in browser and I'm not even sure if you can use UDP sockets directly. Also, I just wanted to use cloudflare's durable objects.

  My plan was to make the pong multiplayer, and then create a 2 player chess game and put it up as one of my portfolio piece.
]
#columns(2)[

  #text(size: 0.85em)[
    #quote(
      "Durable Objects provide a building block for stateful applications and distributed systems.

Use Durable Objects to build applications that need coordination among multiple clients, like collaborative editing tools, interactive chat, multiplayer games, and deep distributed systems, without requiring you to build serialization and coordination primitives on your own.

...omitted...

Therefore, Durable Objects enable stateful serverless applications.",
      attribution: [#link("https://developers.cloudflare.com/durable-objects/")[Cloudflare Durable Objects Documentation]<links>],
    )
  ]

  #colbreak()

  === Key Points
  - Learned networking code
  - Precursor to making online multiplayer games
  - Ease of use in browser

  === Technologies Used
  #columns(2)[
    - Cloudflare Workers
    - Durable Objects
    #colbreak()
    - WebSocket
    - TypeScript
  ]
  === Links
  - #github-link(
      repo: "workers-durable-object-websocket-synced",
      preview: [GitHub:pawarherschel/workers...],
      first-commit: datetime(day: 1, month: 12, year: 2024),
    )
]

== Brainfuck Compiler with Cranelift <ngd:bf>
#speaker-note[
  The only reason this exists is because I wanted to use cranelift and compile code to native.

  Aside from creating for the sake of creating, I wanted to have some experience with compilers as I was going to attend a meetup in Banglore hosted by Bosch. One of their lead engineers is creating a the RISC-V compilation target for Cranelift.

  I shared my experience of C++ with him and It was validating to hear that he shared a similar experience.
]
=== Key Points
- Wanted to learn how to make frontend for a language
- Used a language known for it's small compiler frontend footprint
- Used Cranelift, an alternative to LLVM written in pure rust

=== Technologies Used
- Rust
- Cranelift

=== Links
- #[#link("https://rodrigodd.github.io/2022/11/26/bf_compiler-part3.html")[Compiling Brainfuck code - Part 3: A Cranelift JIT Compiler]<link>]
- #github-link(
    repo: "BFCranelift",
    first-commit: datetime(day: 17, month: 11, year: 2024),
  )
- #youtube-link(
    video-id: "ilhSdmv6bAY",
    creator: "regionaltantrums",
    title: "Compilers in Rust: Cranelift, the All-Rust Codegen Alternative to LLVM (No C/C++, Part 1)",
  )

// == NixOS <ngd:n>
// === Key Points
// - NixOS is a linux distro known for its declarative and reproducible system configurations
// - "Flakes" help remove inconsistencies

// === Technologies Used
// - Linux
// - Nix

// === Links
// - #github-link(
//     repo: "nixos-config",
//     first-commit: datetime(day: 3, month: 10, year: 2024),
//   )

= Skills <s>
Just a quick overview :3

#slide(
  config: config-page(
    header: block(inset: (x: 5%), height: 1fr)[
      #align(center + horizon)[
        #aside[
          #set text(alert-secondary-color)
          I only have a surface level understanding of these things as I learnt just enough for my work requirements
        ]
      ]
    ],
  ),
)[
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
]

= Conclusion <c>
#speaker-note[
  I wanted to share this quote from Steve Jobs, which beautifully captures my philosophy towards creativity. He talks about how creativity isn't about inventing something entirely new out of thin air, but rather about connecting existing experiences and ideas in new ways.

  My project topics are very diverse, but I belive that when the time comes, they will all connect in a beautiful way. It's very exciting when I can apply knowledge I learned in one project helps me in another project.
]
#text(size: 0.7em)[
  #quote(
    "Creativity is just connecting things. When you ask creative people how they did something, they feel a little guilty because they didn't really do it, they just saw something. It seemed obvious to them after a while. That's because they were able to connect experiences they've had and synthesize new things. And the reason they were able to do that was that they've had more experiences or they have thought more about their experiences than other people. Unfortunately, that's too rare a commodity. A lot of people in our industry haven't had very diverse experiences. So they don't have enough dots to connect, and they end up with very linear solutions without a broad perspective on the problem. The broader one's understanding of the human experience, the better design we will have.",
    attribution: [Steve Jobs],
  )
]

== Why Rust?
#speaker-note[
  People are tired of hearing rust is better due to memory safety, while yes, that's good, it's not the only reason rust is good. For me, rust was better for the reasons on right.
]
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

== List of Links

#align(top + left)[
  #set text(0.9em)
  #set enum(tight: true)
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

    for (display, hyperlink, loc) in elems {
      [
        - #display \(*#link(hyperlink)*\) #box(width: 1fr, repeat(gap: 1.5pt)[.]) #link(loc)[#loc.page()]
      ]
    }
  }
]

#codly-disable()
