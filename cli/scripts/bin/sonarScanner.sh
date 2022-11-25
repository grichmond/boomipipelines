#!/bin/bash
set -e
source bin/common.sh

# mandatory arguments
ARGUMENTS=(baseFolder) 
inputs "$@"
if [ "$?" -gt "0" ]
then
    return 255;
fi

if [ ! -z ${sonarHostURL} ]
then
 echov "Running sonarscanner for components under ${baseFolder}."
 if [ -z "${SONAR_HOME}" ]
 then
  echo "Unzipping embedded sonar-scanner..."
  unzip  -qn  ../../sonarqube/sonar-scanner*.zip
	SONAR_HOME="./sonar-scanner-4.2.0.1873-linux"
 else
  echo "Existing sonar-scanner found"
 fi 
 
 cd "${SONAR_HOME}"/bin
 ./sonar-scanner -X \
  -Dsonar.projectKey="${sonarProjectKey}" \
  -Dsonar.projectBaseDir="${baseFolder}" \
  -Dsonar.sources="${baseFolder}" \
  -Dsonar.host.url="${sonarHostURL}" \
  -Dsonar.login="${sonarToken}"
 
 cd "${WORKSPACE}"    
fi

clean
