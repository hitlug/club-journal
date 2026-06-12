#let _assetroot = "../assets"

#let volumecover(date: str, image-path: [image], caption: str) = {
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

#let unify_artitype(artitype) = {
  if type(artitype) != str {
    return str("[Warn] unified_artitype: the type of artitype is illegal!")
  }
  if artitype == "post" {
    return "post"
  } else if artitype == "news" {
    return "技术资讯"
  } else if artitype == "brief" {
    return "简讯"
  } else if artitype == "paper" {
    return "论文分享"
  }
}

#let newpost(content, author: str, title: str, artitype: "post") = {
  if type(artitype) != str {
    artitype = str("post")
  }
  let unified_artitype = unify_artitype(str(artitype))
  pagebreak()
  [#heading(
      level: 2,
      numbering: none,
    )[#unified_artitype: #title]
    #align(right)[#block(fill: luma(240))[by #author]]
    #content]
}
