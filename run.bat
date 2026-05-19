@echo off
chcp 65001 >nul
title Xbench 误报清理工具

echo ================================================
echo   Xbench 误报清理工具  v1.0
echo ================================================
echo.

:: ---------- 检查 Python ----------
python --version >nul 2>&1
if errorlevel 1 (
    echo [错误] 未找到 Python。
    echo 请从 https://www.python.org/downloads/ 安装 Python 3.9+
    echo 安装时勾选 "Add Python to PATH"
    echo.
    pause
    exit /b 1
)

:: ---------- 安装依赖 ----------
echo [1/3] 检查并安装依赖...
pip install -q -r "%~dp0requirements.txt"
if errorlevel 1 (
    echo [错误] 依赖安装失败，请检查网络或手动运行：
    echo   pip install xlrd openpyxl pywin32
    echo.
    pause
    exit /b 1
)
echo       依赖已就绪。
echo.

:: ---------- 输入文件路径 ----------
echo [2/3] 输入文件路径
echo       提示：可以直接把文件拖入此窗口，路径会自动填入
echo.
set /p REF_FILE=  对照文件（含误报标注的文件）:
set /p INPUT_FILE=  待处理文件（要清理的文件）  :
echo.

:: 去掉拖入时自动加的引号
set REF_FILE=%REF_FILE:"=%
set INPUT_FILE=%INPUT_FILE:"=%

:: 检查文件是否存在
if not exist "%REF_FILE%" (
    echo [错误] 对照文件不存在: %REF_FILE%
    pause
    exit /b 1
)
if not exist "%INPUT_FILE%" (
    echo [错误] 待处理文件不存在: %INPUT_FILE%
    pause
    exit /b 1
)

:: ---------- 运行脚本 ----------
echo [3/3] 处理中，请稍候...
echo.
python "%~dp0remove_fp.py" --ref "%REF_FILE%" --input "%INPUT_FILE%"
set RESULT=%errorlevel%

echo.
if %RESULT% equ 0 (
    echo ================================================
    echo   [完成] 已生成清理后文件（文件名含 _cleaned）
    echo ================================================
) else (
    echo ================================================
    echo   [失败] 处理出错，请截图上方错误信息反馈给技术人员
    echo ================================================
)
echo.
pause
