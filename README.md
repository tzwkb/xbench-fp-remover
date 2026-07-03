# Xbench 误报清理工具

<!-- bilingual-readme:start -->

## 双语说明 / Bilingual Documentation

> 本节提供整篇 README 的中英双语维护说明；下方保留原始详细说明、命令、路径和配置示例。
> This section provides bilingual maintenance notes for the full README; the original detailed notes, commands, paths, and configuration examples are preserved below.

### 中文

**概览**：Xbench 误报清理工具，从 pending 文件中批量删除已标记为误报的 QA 条目，并保留原文件格式与样式。

**主要能力**：
- 读取已标记误报的报告。
- 批量删除 pending 文件中的对应条目。
- 尽量保留原 Excel 格式和样式。

**使用方式**：按 README 说明准备 pending 文件和误报标记表后运行清理脚本。

**状态**：该仓库仍按当前 README 的说明维护或使用。

**注意事项**：清理前建议备份原始 QA 文件。

### English

**Overview**: Xbench false-positive removal tool that batch-deletes flagged QA entries from pending files while preserving file formatting and styles.

**Key capabilities**:
- Reads reports with flagged false positives.
- Deletes matching entries from pending files in batch.
- Preserves original Excel formatting and styles where possible.

**Usage**: Prepare pending files and false-positive marker reports according to the README, then run the cleanup script.

**Status**: This repository is maintained or used according to the current README notes.

**Notes**: Back up original QA files before cleanup.

<!-- bilingual-readme:end -->

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