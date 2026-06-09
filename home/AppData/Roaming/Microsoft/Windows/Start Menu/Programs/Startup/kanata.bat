@echo off

for /f "delims=" %%i in ('where kanata*gui*IO*.exe') do start "" %%i
