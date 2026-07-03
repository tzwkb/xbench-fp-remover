# Xbench FP Remover

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![Python](https://img.shields.io/badge/Python-3.x-blue.svg)](https://www.python.org/)
[![Xbench](https://img.shields.io/badge/Xbench-QA%20workflow-blueviolet.svg)](https://www.xbench.net/)

English | [中文](README_ZH.md)

## Overview

 Xbench false-positive removal tool that batch-deletes flagged QA entries from pending files while preserving file formatting and styles.

## Key Capabilities

- Reads reports with flagged false positives.
- Deletes matching entries from pending files in batch.
- Preserves original Excel formatting and styles where possible.

## Usage

 Prepare pending files and false-positive marker reports according to the README, then run the cleanup script.

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
