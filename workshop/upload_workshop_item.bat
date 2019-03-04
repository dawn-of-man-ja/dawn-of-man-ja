@echo off
::set /p user="Enter steam user:"
::set /p password="Enter steam password:"
bin\steamcmd.exe +login %user% %password% +workshop_build_item ..\scripts\workshop_item.vdf
