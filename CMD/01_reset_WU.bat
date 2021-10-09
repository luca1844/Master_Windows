:: File .bat
net stop bits 
net stop wuauserv
del /f /q %windir%\WindowsUpdate.log
del /f /s /q %windir%\SoftwareDistribution\*.*

ren %systemroot%\system32\catroot2 catroot2.bak

net start bits

net start wuauserv 

wuauclt /resetauthorization /detectnow