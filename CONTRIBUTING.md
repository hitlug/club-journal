# 贡献指南

项目目前处于 *alpha* 阶段。

所有新章节放在 `outline.typ` 中。`outline.typ` 需要包含所有需要被排入主文件的，在 front、body、back 三个子目录下的稿件。

body 下的日期遵循东八区。根据稿件定稿和稿件接受时间进行划分。

所有post文件以如下内容开头：

```typst
#import "../../snippet/funct.typ":*

#newpost(author: "你的GitHub ID", title:"你的文章标题")
```

所有被投稿到本仓库的文章，将自动以 README 文件中标注的许可证发布。您也可以在文首或者文末指定别的许可证，但您指定的许可证须**与 CC BY 4.0 International 相兼容**。这意味着您为您作品所取用的许可证必须允许我们将您的作品与本仓库其他作品相组合或者再授权等，而不违反任一许可证的调宽。