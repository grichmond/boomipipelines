#!/bin/bash
cd ${SCRIPTS_HOME}
saveNotes="Triggered by Azure DevOps in ${BUILD_USER_ID} ... ${notes}"
source ./bin/deployPackages.sh notes="${saveNotes}"
echo $deploymentId