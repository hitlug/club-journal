#import "../../snippet/funct.typ":*

#newpost(author: "wold9168", title:"Makefile 里快速插入帮助信息的一种方案")[

写毕设的期间大量阅读代码，在 #link("https://github.com/tailscale/tailscale/")[Tailscale] 的仓库里看到颇为有趣的一个 Makefile Target：

```makefile
help: ## Show this help
	@echo ""
	@echo "Specify a command. The choices are:"
	@echo ""
	@grep -hE '^[0-9a-zA-Z_-]+:.*?## .*$$' ${MAKEFILE_LIST} | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[0;36m%-20s\033[m %s\n", $$1, $$2}'
	@echo ""
.PHONY: help

.DEFAULT_GOAL := help
```

该 Target 的作用是输出本 Makefile 文件里所有带有`##`的行，然后以冒号和`##`为分隔符，把 target 和`##`后的内容输出出来。效果就像是这样的：

```
❯ make

Specify a command. The choices are:

  build386             Build tailscale CLI for linux/386
  buildlinuxarm        Build tailscale CLI for linux/arm
  buildlinuxloong64    Build tailscale CLI for linux/loong64
  buildmultiarchimage  Build (and optionally push) multiarch docker image
  buildwasm            Build tailscale CLI for js/wasm
  buildwindows         Build tailscale CLI for windows/amd64
  check                Perform basic checks and compilation tests
  depaware             Run depaware checks
  generate             Generate code
  help                 Show this help
  kube-generate-all    Refresh generated files for Tailscale Kubernetes Operator
  kube-generate-deepcopy Refresh generated deepcopy functionality for Tailscale kube API types
# ...

```

`.DEFAULT_GOAL` 这个变量也有意思，指定了 Makefile 默认的 Target。所以上面执行`make`的时候都没加`help`这个 Target。

挺好用的。]