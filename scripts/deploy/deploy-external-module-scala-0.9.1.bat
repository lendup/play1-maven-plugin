call ..\set-external-modules-home.bat
set MODULE_NAME=scala
set VERSION=0.9.1
set SRC_DIR=%MODULES_HOME%/%MODULE_NAME%-%VERSION%

set GROUP_ID_PREFIX=com.google.code.maven-play-plugin.
set GROUP_ID=%GROUP_ID_PREFIX%org.playframework.modules.%MODULE_NAME%
set ARTIFACT_ID=play-%MODULE_NAME%-compiler

call mvn clean package source:jar --file %SRC_DIR%/compiler-pom.xml
call mvn deploy:deploy -Dfile=%SRC_DIR%/lib/%ARTIFACT_ID%.jar -DgroupId=%GROUP_ID% -DartifactId=%ARTIFACT_ID% -Dpackaging=jar -Dversion=%VERSION% -DpomFile=%SRC_DIR%/compiler-pom-dist.xml -Dsources=%SRC_DIR%/target/%ARTIFACT_ID%-%VERSION%-sources.jar -DrepositoryId=%REPO_ID% -Durl=dav:%REPO_URL% -e

set ARTIFACT_ID=play-%MODULE_NAME%
call deploy-external-module-with-jar.bat

