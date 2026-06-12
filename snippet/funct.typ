#import "/config.typ": *
#let _assetroot = "../assets"

// 排版专有名词
// 暂且用来排版标题前面的文章类型提示符
#let typographic_proper_noun(content) = {
  box(baseline: 15%)[#rect(fill: black, height: auto, inset: 0.2em)[#text(
    font: _sans_font,
    size: 0.8em,
    fill: white,
  )[#content]]]
}

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
    return str("[Error] unify_artitype: 文章类型参数错误")
  }
  if artitype == "post" {
    return "post"
  } else if artitype == "news/tech" {
    return "技术资讯"
  } else if artitype == "news/club" {
    return "社团资讯"
  } else if artitype == "news/campus" {
    return "校园资讯"
  } else if artitype == "brief" {
    return "简讯"
  } else if artitype == "paper" {
    return "论文分享"
  } else if artitype == "misc" {
    return "杂项"
  } else {
    return "[Error] unify_artitype: 未分类"
  }
}

#let newpost(content, author: str, title: str, artitype: "post") = {
  if type(artitype) != str {
    artitype = str("post")
  }
  let unified_artitype = unify_artitype(str(artitype))
  [#heading(
      level: 2,
      numbering: none,
    )[#typographic_proper_noun[技术资讯]: #title]
    #align(right)[#block(fill: luma(240))[by #author]]
    #content]
}
