@echo off
REM 1 - Generate createnetcore.cmd via XSLT
powershell -file xslt.ps1 %1 SolutionModel2cmd.xsl createnetcore.cmd
REM 2 - Execute 
createnetcore.cmd %2

