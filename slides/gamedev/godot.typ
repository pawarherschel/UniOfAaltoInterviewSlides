#import "../../utils.typ": *

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
      ..godot-games
    )
  ]
}
