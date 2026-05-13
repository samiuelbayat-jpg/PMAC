@echo off
cd /d "%~dp0"
start "PMAC Local Server" cmd /k node serve.cjs
timeout /t 2 >nul
start "" http://127.0.0.1:8787/
