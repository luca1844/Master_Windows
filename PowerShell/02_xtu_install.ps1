#######################################################
# Vedere about_Execution_Policies
# Get-ExecutionPolicy -> Se: Restricted -> Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Scope Process
#######################################################

cd $HOME
cd .\Downloads\
wget -o XTUSetup.exe https://downloadmirror.intel.com/29183/eng/XTUSetup.exe

.\XTUSetup.exe

# Proceed until error message on screen - Don't exit
Read-Host "Proceed until error message on screen - Don't exit"
cp 'C:\ProgramData\Package Cache\{E353FE8F-BA43-4817-9106-3C6C144BC70C}v7.0.1.4\Intel_XtuInstaller.msi' "C:\Users\$env:USERNAME\Downloads"

# Exit the .exe installer
Read-Host "Exit the .exe installer and press Enter"

cmd
msiexec /i Intel_XtuInstaller.msi DISABLEPLATFORMCHECK=1