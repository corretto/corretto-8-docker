#!/bin/bash
set -euo pipefail

# 1. Fetch and setup test framework.
# For more info and usage examples, see:
#   https://github.com/GoogleContainerTools/container-structure-test
mkdir -p build/tool
wget -N \
     -P build/tool \
      https://storage.googleapis.com/container-structure-test/latest/container-structure-test-linux-amd64
chmod +x build/tool/container-structure-test-linux-amd64

# 2. Build the docker image.
docker build --tag corretto-8 .

# 3. Test using container-structure-test.
build/tool/container-structure-test-linux-amd64 test \
    --image corretto-8 \
    --config test-image.yaml
