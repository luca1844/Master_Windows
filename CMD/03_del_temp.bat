:: File .bat
:: /F -- forces the deletion of read-only files.
:: /Q -- enables quiet mode. You are not ask if it is ok to delete files.
:: /S -- runs the command on all files in any folder under the selected structure.
:: *.* -- delete all files.

del /f /s /q %temp%\*.*
del /f /s /q %WinDir%\Prefetch\*.*
del /f /s /q %WinDir%\Temp\*.*
del /f /s /q %WinDir%\SoftwareDistribution\Download\*.*
 
set /p key=All elements deleted. Press any key for exit.
