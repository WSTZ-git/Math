# 本科毕业论文：常微分方程初值问题的算法与应用

副题：**IMEX 格式在 Burgers 方程上的耦合刚性稳定性分析**

本目录为论文的 LaTeX 源文件与最终 PDF。

## 编译方法

推荐使用 `latexmk`（会自动调用 XeLaTeX 与 Biber）：

```bash
cd "Paper/Undergraduate Thesis"
latexmk -xelatex main.tex
```

或手动执行：

```bash
xelatex main.tex
biber main
xelatex main.tex
xelatex main.tex
```

最终文件为 `main.pdf`。

## 环境要求

- TeX Live 2025（或较新的 TeX Live）
- `ctex`、`biblatex`、`biblatex-gb7714-2015`、`tcolorbox`、`listings`、`booktabs`、`fancyhdr` 等宏包
- 字体：优先使用 `Noto Serif CJK SC` / `Noto Sans CJK SC` / `Noto Sans Mono CJK SC`；若系统未安装，`main.tex` 会自动回退到 TeX Live 自带的 Fandol 字体。拉丁文与数学字体使用 `TeX Gyre Termes`。
- 参考文献使用 Biber 后端

在 Debian/Ubuntu 上，可通过 `texlive-full` 与 `fonts-noto-cjk` 安装上述依赖。

## 封面信息

`frontmatter.tex` 中已填写：

- 学院：基础科学学院
- 专业：数学与应用数学
- 学号：202336020064
- 姓名：邹文杰
- 指导教师：任中贵
- 日期：二〇二六年十一月

如学校有统一的封面模板或格式要求，可只保留本模板的正文部分，替换封面与页眉。

## 目录结构

```text
Undergraduate Thesis/
├── main.tex                 # 主文件（导言区、章节组织）
├── frontmatter.tex          # 封面
├── front/abstract.tex       # 中英文摘要
├── refs.bib                 # 参考文献
├── chapters/
│   ├── ch1.tex              # 绪论
│   ├── ch2.tex              # 预备知识
│   ├── ch3.tex              # 模型与参数化分裂族
│   ├── ch4.tex              # 耦合刚性稳定性分析
│   ├── ch5.tex              # 数值验证
│   ├── ch6.tex              # Jin-Xin 松弛系统的源项分裂
│   ├── ch7.tex              # 结论与展望
│   ├── appendix.tex         # 核心代码与复现说明
│   └── acknowledgements.tex # 致谢
├── figures/                 # 论文插图（由代码生成后复制到此）
└── main.pdf                 # 编译结果
```

## 图表与代码的对应

论文中的全部数值插图由 `Code/Undergraduate Thesis Code` 生成，复制到 `figures/` 后由 `main.tex` 引用。图 4.3 是连续符号下的联合稳定域，对应新增的 `stability_coupled.pdf`。若修改了代码或参数，请重新生成图片并覆盖 `figures/` 中的同名文件，然后重新编译。

- 图 4.1：`figures/stability_geometry.pdf`
- 图 4.2：`figures/stability_region.pdf`
- 图 4.3：`figures/stability_coupled.pdf`
- 图 4.4：`figures/stability_discrete.pdf`
- 图 5.1：`figures/stiff_heatmap.pdf`
- 图 5.2：`figures/maxdt.pdf`
- 图 5.3：`figures/shock_results.pdf`
- 图 5.4：`figures/convergence.pdf`
- 图 6.1：`figures/jinxin_stability.pdf`
- 图 6.2：`figures/jinxin_numerics.pdf`

## 说明

- 论文题目采用学校给定的“常微分方程初值问题的算法与应用”，副题说明具体研究内容；如学校要求题目与内容完全一致，可在封面与页眉中调整。
- 论文中的数值结果来自确定性计算，无随机数；表 5.1--5.3、6.1--6.2 的数值与 `Code/.../data/` 中的 CSV 对应。
- 参考文献采用 GB/T 7714--2015 格式（`biblatex-gb7714-2015`）。
