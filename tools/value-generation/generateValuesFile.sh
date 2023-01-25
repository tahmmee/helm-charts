#!/bin/bash
set -eu
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

CRD_FILE=${CRD_FILE:-$SCRIPT_DIR/../../couchbase-operator/crds/couchbase.crds.yaml}

docker build --no-cache -t values-generator "${SCRIPT_DIR}"

# To find start/end easily and for redirection purposes
echo "==== START ===="
docker run --rm -i values-generator "$@" - < "${CRD_FILE}"
echo "==== END ===="
