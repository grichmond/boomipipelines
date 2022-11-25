#!/bin/bash
cd ${SCRIPTS_HOME}
git reset --hard HEAD
git pull && git checkout master
source ./bin/updateExtensions.sh
echo $envId
