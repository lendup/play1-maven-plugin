set VERSION=1.2.5.6
call ..\set-play-home-%VERSION%.bat

set MODULE_NAME=docviewer

call deploy-play-module-without-jar.bat
