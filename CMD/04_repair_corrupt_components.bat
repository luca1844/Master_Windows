@echo off

echo Scan your system files and to repair missing or corrupted system files (SFC.exe).
sfc /scannow

echo Scan the image for component store corruption (The DISM /ScanHealth argument).
Dism.exe /Online /Cleanup-Image /ScanHealth

echo Check whether the image has been flagged as corrupted by a failed process and whether the corruption can be repaired (The DISM /CheckHealth argument).
Dism.exe /Online /Cleanup-Image /CheckHealth

echo Scan the image for component store corruption, and then perform repair operations automatically (The DISM /RestoreHealth argument).
Dism.exe /Online /Cleanup-Image /RestoreHealth

echo Clean up the superseded components and reduce the size of the component store (The DISM /StartComponentCleanup argument).
Dism.exe /Online /Cleanup-Image /StartComponentCleanup

set /p key=Script complete.