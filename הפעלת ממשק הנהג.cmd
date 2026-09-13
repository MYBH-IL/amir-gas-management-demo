@echo off
chcp 65001 >nul
cd /d "%~dp0"

where node >nul 2>nul
if errorlevel 1 (
  echo Node.js is not installed on this computer.
  echo Install Node.js from https://nodejs.org and run this file again.
  pause
  exit /b 1
)

if not exist "node_modules" (
  echo Installing the demo components for the first run...
  call npm.cmd install --cache .npm-cache
  if errorlevel 1 (
    echo Installation failed. Check the internet connection and try again.
    pause
    exit /b 1
  )
)

start "Amir Gas Demo Server" /min cmd /c "npm.cmd run dev"
timeout /t 3 /nobreak >nul
start "" "http://localhost:5173/driver"
exit
