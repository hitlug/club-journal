#let _assetroot = "../assets"

#let volumecover(date:str, image-path:[image], caption:str) = {
  page()[
    #align(right)[
      #heading(numbering: none)[#date]
      #figure(numbering: none)[#image(_assetroot + "/" + image-path)]
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