# Xbench 误报清理工具

English | [中文](README_ZH.md)


## Overview

 Xbench false-positive removal tool that batch-deletes flagged QA entries from pending files while preserving file formatting and styles.

## Key Capabilities

- Reads reports with flagged false positives.
- Deletes matching entries from pending files in batch.
- Preserves original Excel formatting and styles where possible.

## Usage

 Prepare pending files and false-positive marker reports according to the README, then run the cleanup script.

## Status

 This repository is maintained or used according to the current README notes.

## Notes

 Back up original QA files before cleanup.

## Command and Configuration Reference

The following code blocks keep commands, paths, filenames, and configuration keys literal; explanatory comments are translated for the English README.

```
pip install -r requirements.txt
```

```
python remove_fp.py --ref <reference-file> --input <input-file> [--output <output-path>]
```

```
python remove_fp.py --ref "modified-Xbench_QA.xls" --input "Xbench_QA.xls"
```

## Detailed Technical Notes

The primary README keeps the original technical details, history notes, full commands, and file layout. This file maintains the English version of the core documentation; consult the primary README code blocks and paths when exact commands are needed.
