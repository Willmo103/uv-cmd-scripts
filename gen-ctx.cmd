@echo off
REM This script generates markdown documentation for the wembed_core project using devtul.
:: test to see if devtul is installed, if not install it
uv run devtul --help
if errorlevel 1 (
    echo ^> devtul not found, installing...
) else (
    echo ^> devtul found.
    goto :continue
)

uv add https://github.com/willmo103/devtul.git --dev
if errorlevel 1 (
    echo ^> Failed to install devtul. Aborting.
    exit /b 1
)


set project_dir=%~dp0..
cd /d %project_dir%
uv version --short > .project_version
:: Make a version dir if it doesn't exist
if not exist .context md .context
set /p project_version=<.project_version
if not exist .context\%project_version% md .context\%project_version%
set project_version_fn_base=.context\%project_version%\%project_version%
uv run devtul md -f %project_version_fn_base%_src.md --sub-dir src/wembed_core --empty %project_dir%
exit /b 0x0
