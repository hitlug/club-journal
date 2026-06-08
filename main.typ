#import "config.typ": *
#import "@preview/ilm:2.0.0": *
#import "@preview/mitex:0.2.5": *

#set text(
  font: (
    (name: "BlexMono Nerd Font", covers: "latin-in-cjk"),
    (name: "FiraCode Nerd Font", covers: "latin-in-cjk"),
    (name: "IBM Plex Mono", covers: "latin-in-cjk"),
    "Source Han Serif",
    "FandolSong",
  ),
  lang: _lang,
  region: _region,
)
#set par(first-line-indent: 2em)

#show: ilm.with(
  title: _title,
  authors: _authors,
  date: _date,
  abstract: _abstract,
  bibliography: _bibliography,
  figure-index: (enabled: true),
  table-index: (enabled: true),
  listing-index: (enabled: true),
)

#show link: it => {
  text()[#underline(it)]
}
#show ref: it => {
  text()[#underline(it)]
}
#let volume-cover(date:str, image-path:[image], caption:str) = {
  page()[
    #align(right)[
      #heading(numbering: none)[#date]
      #figure(numbering: none)[#image(image-path)]
      #block(fill: luma(240))[
        #align(right)[#caption]
      ]
    ]
  ]
}
#let newpost(author: str, title: str) = {
  pagebreak()
  [#heading(
      level: 2,
      numbering: none,
    )[#title]
    #align(right)[#block(fill: luma(240))[by #author]]]
}

#include "outline.typ"
