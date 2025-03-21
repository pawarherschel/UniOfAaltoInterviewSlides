#import "../../utils.typ": *

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
