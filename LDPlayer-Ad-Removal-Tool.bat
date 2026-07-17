:: =========================================================================================
:: Copyright (c) 2026 countryside99. Licensed under the GNU GPL v3.
:: Original Repository: https://github.com/countryside99/LDPlayer-Ad-Removal-Tool
:: =========================================================================================
@echo off
setlocal enabledelayedexpansion
chcp 65001 >nul
cls

set "LD_DIR=C:\LDPlayer\LDPlayer9"
set "XUANZHI=%appdata%\XuanZhi9"
set "HTA_FILE=%temp%\ldgui.hta"

for /f "tokens=2 delims==" %%i in ('wmic os get locale /value 2^>nul') do set "sys_locale=%%i"

set "gui_title=LDPlayer Ad Removal Tool"
set "gui_desc=Instantly eliminate all commercial advertisements from LDPlayer9."
set "gui_btn=Launch Ad-Block Removal"
set "cmd_banner=                       LDPlayer Ad Removal Tool"
set "cmd_kill=[DEBUG] Terminating active processes to apply file hardening..."
set "cmd_clean=[DEBUG] Cleaning Windows installation skin folders..."
set "cmd_lock=[DEBUG] Locking Windows installation skin folders..."
set "cmd_appdata=[DEBUG] Securing AppData directory folders..."
set "cmd_complete=  Operation Complete, Enjoy your free ad experience on LDPlayer!"

if "%sys_locale%"=="040c" (
    set "gui_title=Outil de Suppression de Publicit&eacute;s LDPlayer"
    set "gui_desc=&Eacute;liminez instantan&eacute;ment toutes les publicit&eacute;s commerciales de LDPlayer9."
    set "gui_btn=Lancer la Suppression des Pubs"
    set "cmd_banner=                Outil de Suppression de Publicites LDPlayer"
    set "cmd_kill=[DEBUG] Arret des processus actifs pour appliquer le verrouillage des fichiers..."
    set "cmd_clean=[DEBUG] Nettoyage des dossiers d'installation skin de Windows..."
    set "cmd_lock=[DEBUG] Verrouillage des dossiers d'installation skin de Windows..."
    set "cmd_appdata=[DEBUG] Securisation dei dossier nella directory AppData..."
    set "cmd_complete=  Operation Terminee, Profitez d'une experience sans publicite sur LDPlayer!"
)

if "%sys_locale:~-2%"=="0a" (
    set "gui_title=Herramienta de Eliminaci&oacute;n de Publicidad LDPlayer"
    set "gui_desc=Elimine instant&aacute;neamente todos los anuncios comerciales de LDPlayer9."
    set "gui_btn=Lanzar Eliminaci&oacute;n de Publicidad"
    set "cmd_banner=             Herramienta de Eliminacion de Publicidad LDPlayer"
    set "cmd_kill=[DEBUG] Terminando procesos activos para aplicar el endurecimiento of archivos..."
    set "cmd_clean=[DEBUG] Limpiando carpetas de instalacion de skins de Windows..."
    set "cmd_lock=[DEBUG] Bloqueando carpetas de instalacion de skins de Windows..."
    set "cmd_appdata=[DEBUG] Asegurando las carpetas del directorio AppData..."
    set "cmd_complete=  ¡Operacion Completada, Disfrute de su experiencia libre de publicidad en LDPlayer!"
)

if "%sys_locale%"=="0410" (
    set "gui_title=Strumento di Rimozione Pubblicità; LDPlayer"
    set "gui_desc=Elimina istantaneamente tutti gli annunci pubblicitari da LDPlayer9."
    set "gui_btn=Avvia Rimozione Pubblicit&agrave;"
    set "cmd_banner=                   Strumento di Rimozione Pubblicita LDPlayer"
    set "cmd_kill=[DEBUG] Chiusura dei processi attivi per applicare le restrizioni ai file..."
    set "cmd_clean=[DEBUG] Pulizia delle cartelle skin di installazione di Windows..."
    set "cmd_lock=[DEBUG] Blocco delle cartelle skin di installazione di Windows..."
    set "cmd_appdata=[DEBUG] Messa in sicurezza delle cartelle nella directory AppData..."
    set "cmd_complete=  Operazione Completata, Goditi LDPlayer senza annunci pubblicitari!"
)

echo ^<html^>^<head^>^<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /^>^<title^>LDPlayer Ad Removal Tool^</title^> > "%HTA_FILE%"
echo ^<hta:application id="ldgui" border="thin" scroll="no" maximizebutton="no" minimizebutton="no" sysmenu="yes" /^> >> "%HTA_FILE%"
echo ^<style^> >> "%HTA_FILE%"
echo * { box-sizing: border-box; user-select: none; -ms-user-select: none; } >> "%HTA_FILE%"
echo body { background-color: #121212; color: #FFFFFF; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; padding: 25px; margin: 0; overflow: hidden; text-align: center; } >> "%HTA_FILE%"
echo h1 { color: #00FF66; font-size: 24px; margin: 0 0 12px 0; text-align: center; font-weight: bold; width: 100%%; } >> "%HTA_FILE%"
echo p { color: #AAAAAA; font-size: 14px; margin: 0 0 25px 0; text-align: center; line-height: 1.4; width: 100%%; } >> "%HTA_FILE%"
echo .btn-container { width: 100%%; text-align: center; margin: 0 auto; } >> "%HTA_FILE%"
echo .btn { background-color: #00FF66; color: #000000; border: none; width: 90%%; max-width: 400px; padding: 14px 0; font-size: 16px; font-weight: bold; border-radius: 6px; cursor: pointer; transition: all 0.2s ease-in-out; display: inline-block; text-transform: uppercase; letter-spacing: 0.5px; text-align: center; margin: 0 auto; } >> "%HTA_FILE%"
echo .btn:hover { background-color: #00CC55; box-shadow: 0 0 15px rgba(0, 255, 102, 0.5); } >> "%HTA_FILE%"
echo ^</style^>^<script language="VBScript"^> >> "%HTA_FILE%"
echo Sub Window_OnLoad: width = 520: height = 260: window.resizeTo width, height: window.moveTo (screen.width - width) \ 2, (screen.height - height) \ 2: End Sub >> "%HTA_FILE%"
echo Sub RunAction: CreateObject("WScript.Shell").Run "cmd.exe /c echo GUI_CLICKED > %temp%\ldclick.txt", 0, True: window.close: End Sub >> "%HTA_FILE%"
echo ^</script^>^</head^>^<body^> >> "%HTA_FILE%"
echo ^<h1^>!gui_title!^</h1^> >> "%HTA_FILE%"
echo ^<p^>!gui_desc!^</p^> >> "%HTA_FILE%"
echo ^<div class="btn-container"^>^<button class="btn" onclick="RunAction"^>!gui_btn!^</button^>^</div^> >> "%HTA_FILE%"
echo ^</body^>^</html^> >> "%HTA_FILE%"

if exist "%temp%\ldclick.txt" del "%temp%\ldclick.txt" >nul 2>&1
mshta "%HTA_FILE%"

if not exist "%temp%\ldclick.txt" (
    del "%HTA_FILE%" >nul 2>&1
    exit
)

del "%HTA_FILE%" >nul 2>&1
del "%temp%\ldclick.txt" >nul 2>&1

echo =====================================================================
echo !cmd_banner!
echo =====================================================================
echo.

echo !cmd_kill!
taskkill /f /im dnplayer.exe >nul 2>&1
taskkill /f /im ldnews.exe >nul 2>&1
taskkill /f /im ldbox.exe >nul 2>&1

echo !cmd_clean!
icacls "res" /grant everyone:F /t >nul 2>&1
icacls "skin" /grant everyone:F /t >nul 2>&1

rd /s /q "res\ad" >nul 2>&1
rd /s /q "skin\ad" >nul 2>&1
del /f /q "res\splash*.jpg" >nul 2>&1
del /f /q "res\splash*.png" >nul 2>&1

mkdir "res\ad" >nul 2>&1
mkdir "skin\ad" >nul 2>&1
echo. > "res\splash.jpg"
echo. > "res\splash.png"

echo !cmd_lock!
icacls "res\ad" /inheritance:d >nul 2>&1
icacls "res\ad" /deny everyone:(OI)(CI)(W) >nul 2>&1
icacls "skin\ad" /inheritance:d >nul 2>&1
icacls "skin\ad" /deny everyone:(OI)(CI)(W) >nul 2>&1
icacls "res\splash.jpg" /inheritance:d >nul 2>&1
icacls "res\splash.jpg" /deny everyone:(W) >nul 2>&1
icacls "res\splash.png" /inheritance:d >nul 2>&1
icacls "res\splash.png" /deny everyone:(W) >nul 2>&1

cd /d "%XUANZHI%" >nul 2>&1

echo !cmd_appdata!
icacls "cache" /grant everyone:F /t >nul 2>&1
icacls "vms\recommend" /grant everyone:F /t >nul 2>&1
icacls "ldadconfig.data" /grant everyone:F /t >nul 2>&1
attrib -R "ldadconfig.data" >nul 2>&1

rd /s /q "cache" >nul 2>&1
rd /s /q "vms\recommend" >nul 2>&1
del /f /q "ldadconfig.data" >nul 2>&1

mkdir "cache" >nul 2>&1
mkdir "vms\recommend" >nul 2>&1
echo. > "ldadconfig.data"

icacls "cache" /inheritance:d >nul 2>&1
icacls "cache" /remove everyone >nul 2>&1
icacls "cache" /deny everyone:(OI)(CI)(F) >nul 2>&1

icacls "vms\recommend" /inheritance:d >nul 2>&1
icacls "vms\recommend" /remove everyone >nul 2>&1
icacls "vms\recommend" /deny everyone:(OI)(CI)(F) >nul 2>&1

icacls "ldadconfig.data" /inheritance:d >nul 2>&1
icacls "ldadconfig.data" /remove everyone >nul 2>&1
icacls "ldadconfig.data" /deny everyone:(F) >nul 2>&1
attrib +R "ldadconfig.data" >nul 2>&1

echo.
color 0A
echo =====================================================================
echo !cmd_complete!
echo  If this tool helped you, please leave a Star on GitHub! ⭐
echo  https://github.com/countryside99/LDPlayer-Ad-Removal-Tool
echo =====================================================================
echo.
pause
