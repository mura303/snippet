<# : batch portion (begins PowerShell multi-line comment block)


@echo off & setlocal
set "POWERSHELL_BAT_ARGS=%*"

echo ---- FROM BATCH
powershell -noprofile -NoLogo "iex (${%~f0} | out-string)"
pause

exit /b %errorlevel%

: end batch / begin PowerShell chimera #>

$VAR = "---- FROM POWERSHELL";
$VAR;
$POWERSHELL_BAT_ARGS=$env:POWERSHELL_BAT_ARGS
$POWERSHELL_BAT_ARGS
