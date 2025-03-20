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

#show: show-rules

#title-slide()
#include "slides/pre.typ"
#title-slide()

#include "slides/introduction.typ"

#include "slides/gamedev.typ"
#include "slides/artsy.typ"
#include "slides/non-gamedev.typ"

#include "slides/skills.typ"

#include "slides/conclusion.typ"

#include "slides/appendix.typ"
