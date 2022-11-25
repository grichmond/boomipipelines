# Write your commands here
pwd
source ./BoomiCLI/cli/scripts/bin/exports.sh

# sudo apt-get install -y jq libxml2-utils 

# We fix sonar version
# export SONAR_SCANNER_VERSION=4.5.0.2216
# export DEBIAN_FRONTEND=noninteractive

# # We install the basics
# sudo apt-get -qq -y update
# sudo apt-get -qq install -y curl unzip nodejs npm python3 libxml2-utils

# Download and install the scanner
# curl --insecure -OL https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-${SONAR_SCANNER_VERSION}-linux.zip
# unzip sonar-scanner-cli-${SONAR_SCANNER_VERSION}-linux.zip
# export PATH="/sonar-scanner-${SONAR_SCANNER_VERSION}-linux/bin:${PATH}"

# This set the variables used in Azure DevOps pipeline.
# Mostly constants
export h1="${H1}"
export h2="${H2}"

# Get values from user or parameter store
# The following credentials can be stored in parameter store and retrieved dynamically
# Example to retrieve form an AWS store "${aws ssm get-parameter --region xx --with-decryption --output text --query Parameter.Value --name /Parameter.name}
export accountName="${ACCOUNTNAME}"
export accountId=${ACCOUNTID}
# export authToken=${authToken} # Passed in as environment variable authToken=$(authToken)
# export gitComponentRepoURL="${gitComponentRepoURL}" # Passed in as environment variable
export gitComponentUserName="${GITCOMPONENTUSERNAME}"
export gitComponentUserEmail="${GITCOMPONENTUSEREMAIL}"
export sonarHostURL="${SONARHOSTURL}"
# export sonarHostToken="${sonarHostToken}" # Passed in as environment variable
export sonarProjectKey="${SONARPROJECTKEY}"
export gitComponentRepoName="${GITCOMPONENTREPONAME}" # Top level folder of the GIT REPO
export gitComponentCommitPath="${GITCOMPONENTCOMMITPATH}" # export gitComponentCommitPath="?version=GBmaster&path=" this is used in code review report 
export sonarRulesFile="${SONARRULESFILE}"

# Keys that can change
export VERBOSE="${VERBOSE}" # Bash verbose output; set to true only for testing, will slow execution.
export SLEEP_TIMER="${SLEEP_TIMER}" # Delays curl request to the platform to set the rate under 5 requests/second
export gitComponentOption="${GITOPTION}" # This clones the repo; else default is to create a release tag. Check gitPush.sh file
export SONAR_HOST=""  # If sonar scanner is installed locally then will use the local sonar scanner. Check the sonarScanner.sh file
export GITCLIREPONAME="BoomiCLI"
export GITRELEASEREPONAME="BoomiRelease"

# Derived keys
export baseURL=https://api.boomi.com/api/rest/v1/$accountId
export regressionTestURL="${REGRESSIONTESTURL}" # URL for regression test suite framework.
echo "Base URL is ${baseURL}"

CLI_DIR="${SYSTEM_ARTIFACTSDIRECTORY}/${GITCLIREPONAME}"
RELEASE_DIR="${SYSTEM_ARTIFACTSDIRECTORY}/${GITRELEASEREPONAME}"
echo "CLI DIR is ${CLI_DIR}"
cd "${CLI_DIR}/cli/scripts"
export WORKSPACE="$(pwd)"
echo "Executing script for file=${RELEASE_DIR}/${FILE} in WORKSPACE ${WORKSPACE}."
bin/dynamicScriptJobBuilder.sh file="${RELEASE_DIR}/${FILE}"
