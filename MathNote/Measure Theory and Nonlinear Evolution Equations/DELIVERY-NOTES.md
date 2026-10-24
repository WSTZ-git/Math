# 交付说明 — Measure Theory and Nonlinear Evolution Equations 中译 LaTeX 工程

源书：Flavia Smarrazzo, Alberto Tesei, *Measure Theory and Nonlinear Evolution Equations*,
De Gruyter Studies in Mathematics 86, 2022。

本工程严格遵循 `D:\Data\SKILL\PDF_LaTeX重构提示词.txt`（v13）。
**所有改动仅限 `translate-latex/` 目录内**；`Template/`、`Styles/` 及其他兄弟工程均未触碰。

## 当前状态（已验证可编译）

- `latexmk -g -xelatex` 干净重编 **exit 0，0 错误**。
- 产物 `main.pdf` 共 **33 页**。
- 未定义引用由骨架初建时的 ~496 降至 **51**，全部是指向尚未撰写的第 1–8 章的前向
  `\cref{}`；随对应章节撰写而逐一消除，属预期。
- 参考文献 109 条已全部录入 `reference.bib`，正文 `\cite{}` 已渲染为编号 [n]。

### 已完成
1. **工程骨架**：`main.tex`（elegantbook，lang=cn，自定义青色 RGB(0,176,183)，16:9 适配），
   `contents/` 分章文件，`image/`，`_tools/`。
2. **引言（Introduction，源书 phys 14–34）整段中译**，约 650 行：
   - 环境语义重组：`proposition:intro-0.2.1/0.2.3/0.2.4`、`theorem:intro-0.2.2`、
     `lemma:intro-0.3.1`、`proposition:intro-0.3.2/0.3.3`、`remark:intro-0.1.1/0.3.1` 等；
   - 原书命名问题 (E0)(P0)(BC)(C)(P)(CL)(CLepsilon)(CL1)(CL2)(Rn)(FB)(Sepsilon)(S)(PMepsilon)(Sigmaepsilon)(A1)(A2)(A3)
     统一改为 `align*` 无编号陈列、右侧 `\qquad(名称)`，正文引用字面化；
   - 两张插图：`image/fig-cubic.png`（三次函数 phi，源 phys 26）、
     `image/fig-perona.png`（Perona-Malik 型 phi，源 phys 27），均高 dpi 渲染后 PIL 裁剪并目检合格。
3. **参考文献**：`reference.bib` 录入原书 Bibliography（phys 438–443）全部 109 条。
4. **逐页截图验收**：已目检 pg-01（封面）、pg-05/13/14（公式密集页）、pg-15（引言结尾约定）、
   pg-17（Part I 占位）。中文排版、cases 块、命名问题右侧标注、boxed proposition 环境均正常。

### 尚未完成（占位「待翻译」）
- Part I 提要（phys 36–39）
- 第 1 章 测度论（phys 40–87）
- 第 2 章 标量积分与微分（phys 88–143）
- 第 3 章 函数空间与容量（phys 144–187）
- 第 4 章 向量积分（phys 188–253）
- 第 5 章 有限 Radon 测度序列（phys 254–309）
- Part II 提要（phys 310–313）
- 第 6 章 拟线性抛物方程（phys 314–355）
- 第 7 章 双曲守恒律（phys 356–405）
- 第 8 章 前向-后向抛物方程（phys 406–437）
- Appendix A 拓扑空间（phys 444–449）
- 符号表（phys 450–451）
- v13 第 9 节审计台账 `audit/*.csv`、`check.py`、`glossary-terms.md`

## 写作硬约定（续译时必须遵守）
- 标签前缀用完整环境名：`theorem:`/`proposition:`/`definition:`/`lemma:`/`corollary:`/
  `remark:`/`example:`/`exercise:`/`align:`/`figure:`，**禁止** `thm:`/`eq:` 缩写。
- 全文交叉引用用 `\cref{}`/`\eqref{}`，`\cref` 前不加空格。
- 虚数单位 `\mathrm{i}`，微分 `\mathrm{d}`；禁 `\tag`/`$$`/`\[ \]`/`equation*`。
- 拉丁人名不音译：Lebesgue 测度、Hölder 不等式、Dirac 质量、Radon 测度、Young 测度等。
- 技术记号：有限 Radon 测度 `\mathscr{R}_f(\Omega)`，正锥 `\mathscr{R}^+_f`，
  Young 测度 `\mathcal{Y}(U;\mathbb{R})`。
- 续写某章时，必须建立引言里已 `\cref` 的同名前向 label，否则对应位置永远是 `??`。

## 工作流备忘
- 重编译：`bash /mnt/c/.../Temp/rebuild.sh`（已含清 aux + latexmk -g）。
- 渲染截图：`bash /mnt/c/.../Temp/render.sh`（pdftoppm 110dpi 到 `_tools/render/pg-*.png`）。
- 读原页：`python3 /mnt/c/.../Temp/dump.py <起物理页> <止物理页>`。
- 物理页到印刷页：印刷页 = 物理页 - 35；引言用罗马页码。
