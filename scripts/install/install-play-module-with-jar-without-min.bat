echo DEPRECATED

@rem call mvn clean install --file %PLAY_HOME%/parent/pom.xml
@rem call mvn clean install --file %PLAY_HOME%/modules/parent/pom.xml

@rem set GROUP_ID_PREFIX=com.google.code.maven-play-plugin.
@rem set GROUP_ID=%GROUP_ID_PREFIX%org.playframework.modules.%MODULE_NAME%
@rem set ARTIFACT_ID=play-%MODULE_NAME%
@rem set SRC_DIR=%PLAY_HOME%/modules/%MODULE_NAME%

@rem call mvn clean package source:jar javadoc:jar --file %SRC_DIR%/pom-build-dist.xml
@rem call mvn install:install-file -Dfile=%SRC_DIR%/lib/%ARTIFACT_ID%.jar -DgroupId=%GROUP_ID% -DartifactId=%ARTIFACT_ID% -Dpackaging=jar -Dversion=%VERSION% -DpomFile=%SRC_DIR%/pom-dist.xml -Dsources=%SRC_DIR%/target/%ARTIFACT_ID%-%VERSION%-sources.jar -Djavadoc=%SRC_DIR%/target/%ARTIFACT_ID%-%VERSION%-javadoc.jar
@rem call mvn install:install-file -Dfile=%SRC_DIR%/target/%ARTIFACT_ID%-%VERSION%-module.zip -DgroupId=%GROUP_ID% -DartifactId=%ARTIFACT_ID% -Dpackaging=zip -Dversion=%VERSION% -Dclassifier=module -DgeneratePom=false