#import "../config.typ": *
#import "@preview/ilm:2.0.0": *
#import "@preview/mitex:0.2.5": *

#set text(
  font: (
    (name: "BlexMono Nerd Font", covers: "latin-in-cjk"),
    "Source Han Serif",
  ),
  lang: _lang,
)
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
