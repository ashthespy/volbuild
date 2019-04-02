@echo off
IF NOT "%1"=="" (SET arch=-b %1) ELSE (SET arch=%1)
SET IMAGE=volumio-build
if NOT "%2"=="" (SET CMD=%2) ELSE (SET CMD=./build.sh %arch%) 
::-d orangepilite -v 3.256
:: Attempt to enable qemu
docker run --rm --privileged multiarch/qemu-user-static:register

:: Build the docker image
echo Building the docker image
docker build -t %IMAGE% -f Dockerfile .

echo Running Docker image with build command: %CMD%
pause
docker run -it --privileged --tty^
	  -v %cd%/Build:/Build^
	  %IMAGE% ^
	  %CMD%
::	  -v %cd%/Images:/Build/build^

	
