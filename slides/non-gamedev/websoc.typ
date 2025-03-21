#import "../../utils.typ": *

== Real-Time WebSocket Synchronization with Durable Objects <ngd:ws>
#show: columns.with(2)

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
