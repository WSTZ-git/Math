# 本科毕业论文代码：IMEX 格式在 Burgers 方程上的耦合刚性稳定性

本目录包含论文全部数值实验的源代码、数据与图片。代码以 Python 实现，结构尽量保持“一个文件对应一类任务”，便于阅读与复现。

## 目录结构

| 文件 | 功能 |
| --- | --- |
| `burgers_imex.py` | 一维粘性 Burgers 方程的有限体积离散、Rusanov 通量、MUSCL/minmod 重构、IMEX-Euler 时间推进、精确行波解与误差度量 |
| `stability_analysis.py` | 双变量稳定性函数、圆盘几何、$(\theta,|z_D|)$ 稳定域相图、联合稳定域、离散放大因子 |
| `run_burgers_experiments.py` | 刚性相图、最大稳定步长、激波精度、网格收敛性四组实验 |
| `plot_results.py` | 从 `data/` 中的缓存数据绘制论文插图 |
| `jinxin.py` | Jin--Xin 松弛系统、两种源项分裂、$2\times2$ 放大矩阵与谱半径 |
| `run_jinxin_experiments.py` | 谱半径扫描、临界 CFL、Riemann 问题数值对比 |
| `stiff_ode_example.py` | 论文第二章刚性 ODE 算例（表 2.1） |
| `plot_style.py` | 统一绘图风格（Noto Serif CJK、Okabe--Ito 配色） |

`data/` 保存 CSV/NPZ 结果，`figures/` 保存 PDF 插图。

## 环境依赖

- Python 3.10 及以上（开发环境为 Python 3.14）
- NumPy、SciPy、Matplotlib

推荐在**本目录内**安装依赖，避免污染系统环境：

```bash
cd "Code/Undergraduate Thesis Code"
bash setup.sh
```

`setup.sh` 会把依赖安装到本目录的 `.pylibs/`，随后运行时设置：

```bash
export PYTHONPATH=.:.pylibs
export MPLCONFIGDIR=/tmp/mplconfig
```

如果系统环境已经具备这些包，可以省略 `.pylibs`，直接运行。

## 复现命令

```bash
cd "Code/Undergraduate Thesis Code"
export PYTHONPATH=.:.pylibs
export MPLCONFIGDIR=/tmp/mplconfig

python3 stiff_ode_example.py          # 表 2.1
python3 stability_analysis.py         # 图 4.1、4.2、4.3
python3 run_burgers_experiments.py all  # 图 5.1--5.4、表 5.1--5.3
python3 run_jinxin_experiments.py     # 图 6.1、6.2、表 6.1、6.2
python3 plot_results.py               # 重新绘制 Burgers 实验图
```

全部实验在普通笔记本上约需数分钟；所有计算均为确定性计算，结果可完全复现。

## 与论文的对应

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

- `shock_profiles.pdf` 是早期版本的剖面图，论文最终使用的是 `shock_results.pdf`。
- `run_burgers_experiments.py` 中的参数与论文表 3.2 一致。最大步长实验不固定物理终时，
  而是固定推进 20000 步，并在初值中叠加幅度 $10^{-8}$ 的网格尺度扰动 $(-1)^j$，
  以激发最不稳定模态。
- 稳定性实验使用一阶 Rusanov 格式，以便与线性符号分析严格对应；精度实验使用 MUSCL/minmod 重构。
- 若需修改网格数或物理参数，请同时调整 `run_burgers_experiments.py` 中的 `Grid` 与 `dt`，并注意 `CFL`、`r=νΔt/Δx²` 的取值范围。
