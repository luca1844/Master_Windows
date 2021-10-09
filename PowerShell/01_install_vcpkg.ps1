# Get-ExecutionPolicy
# Set-ExecutionPolicy unrestricted
# Set-ExecutionPolicy restricted

$name_file = 'file.zip'
$url = 'https://github.com/microsoft/vcpkg/archive/master.zip'
$path = "C:\"

cd $path
wget $url -o $name_file

$new_path = "$path\$name_file"
Expand-Archive -LiteralPath $new_path -DestinationPath $path

cd .\vcpkg-master\
.\bootstrap-vcpkg.bat

.\vcpkg.exe install libirecovery
.\vcpkg.exe install pthread
.\vcpkg.exe install fltk
.\vcpkg.exe install cjson
.\vcpkg.exe install celero
.\vcpkg.exe install curl
.\vcpkg.exe install openssl
.\vcpkg.exe install msmpi

# OpenCV
.\vcpkg.exe install opencv
.\vcpkg.exe install opencv:x86-windows
.\vcpkg.exe install opencv:x64-windows
.\vcpkg install opencv[cuda]
.\vcpkg install pthreads opencv[cuda,ffmpeg]


.\vcpkg.exe integrate install