#!/bin/bash -ex

cd "$(dirname $0)"
BASE_DIR="$(pwd)"

CREDENTIAL="${BASE_DIR}/cdk/.credential.json"
export AWS_ACCESS_KEY_ID=$(jq -r .id < "${CREDENTIAL}")
export AWS_SECRET_ACCESS_KEY=$(jq -r .key < "${CREDENTIAL}")
export AWS_DEFAULT_REGION=$(jq -r .region < "${CREDENTIAL}")

cd "${BASE_DIR}/app"
npm run build

cd "${BASE_DIR}/cdk"
cdk deploy

echo "Completed!"
