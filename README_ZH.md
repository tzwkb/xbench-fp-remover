# Xbench 误报清理工具

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![Python](https://img.shields.io/badge/Python-3.x-blue.svg)](https://www.python.org/)
[![Xbench](https://img.shields.io/badge/Xbench-QA%20workflow-blueviolet.svg)](https://www.xbench.net/)

[English](README.md) | 中文

从 Xbench QA 报告中批量删除已标记为误报的条目，保留原文件格式与样式。

## 原理

1. 读取**对照文件**（已由审校人员在 Comments 列标注误报）
2. 提取所有 `(source_text, target_text, check_type)` 三元组作为删除依据
3. 在**待处理文件**副本上删除匹配行及其孤立标题行
4. 输出 `_cleaned` 文件，原文件不变

匹配条件：source + target + check_type 三项完全一致。

误报标记关键词（大小写不敏感）：`误报` / `FE` / `false positive` / `FP`

## 环境要求

- Python 3.9+
- Microsoft Excel 或 WPS（用于 `.xls` 文件写入，通过 COM 调用）
- 依赖包见 `requirements.txt`

## 安装依赖

```
pip install -r requirements.txt
```

## 使用方式

### 方式一：双击 `run.bat`（推荐）

按提示输入或拖入文件路径即可。

### 方式二：命令行

```
python remove_fp.py --ref <对照文件> --input <待处理文件> [--output <输出路径>]
```

示例：

```
python remove_fp.py --ref "已修改-Xbench_QA.xls" --input "Xbench_QA.xls"
```

默认输出路径：`<输入文件名>_cleaned.<ext>`

## 支持格式

| 格式   | 读取     | 写入                |
|--------|----------|---------------------|
| `.xls` | xlrd     | Excel/WPS COM       |
| `.xlsx`| openpyxl | openpyxl            |

## 输出说明

运行后控制台打印：
- 对照文件识别到的误报三元组数量
- 待处理文件中将删除的行数（数据行 + 孤立标题行）
- 输出文件路径

## 注意事项

- `.xls` 文件写入需要本机安装 Excel 或 WPS 且可正常打开文件
- 对照文件和待处理文件的 check_type 必须一致（来自同一版本 Xbench 导出）
- 脚本只删行，不修改任何单元格内容
