@echo off
title PyIDM Pro
cd /d "%~dp0"

if not exist "venv" (
    echo Creating virtual environment...
    python -m venv venv
)
call venv\Scripts\activate.bat

echo Checking dependencies...
pip install -q -r requirements.txt

echo Starting PyIDM Pro...
python main.py

pause
