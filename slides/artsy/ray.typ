#import "../../utils.typ": *

== Ray Tracing in Rust <ap:r>
#columns(2)[
  #block(height: 1fr)[
    #block(height: 2fr)[
      #figure-image(path: "../../resources/raytracing.png")[
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
