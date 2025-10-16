@echo off

if "%1"=="" (
    echo Usage: uv_script_add.cmd script_name [package1 package2 ...]
    echo.
    echo Example: uv_script_add.cmd my_script.uvm pkg1 pkg2
    exit /b 1
)
if "%2"=="" (
    echo Warning: No packages specified to add to the script.
)

set uv_script_name_arg=%1
set packages_to_add=%2

uv add --script %uv_script_name_arg% %packages_to_add%

if errorlevel 1 (
    echo Failed to add script %uv_script_name_arg% with packages %packages_to_add%.
    exit /b 1
) else (
    echo Successfully added script %uv_script_name_arg% with packages %packages_to_add%.
)
