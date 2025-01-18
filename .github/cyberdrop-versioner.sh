#!/bin/bash

pushd /tmp
wget https://github.com/mikefarah/yq/releases/download/v4.45.1/yq_linux_amd64
chmod 755 ./yq_linux_amd64
git clone https://github.com/jbsparrow/CyberDropDownloader.git

NEWEST_CYBERDROP_VERSION=$(./yq_linux_amd64 '.project.version' './CyberDropDownloader/pyproject.toml')

if [[ $? -gt 0 ]]; then
    echo "FATAL: Could not get version number from cyberdrop releases"
    exit 100
fi

popd

CYBERDROP_CONTAINER_VERSION=$(grep "CYBERDROP_VERSION=" Dockerfile | cut -d '=' -f 2 )

# The version's don't match, kick off the update
if [[ ${NEWEST_CYBERDROP_VERSION} != ${CYBERDROP_CONTAINER_VERSION} ]]; then
    sed -i "s/^ARG CYBERDROP_VERSION=.*$/ARG CYBERDROP_VERSION=${NEWEST_CYBERDROP_VERSION}/" Dockerfile
    git add Dockerfile
    git commit -m "Updated version number to ${NEWEST_CYBERDROP_VERSION} to match codebase"
    git push origin main
    exit 0
else
    echo "INFO: cyberdrop-dl-container is up to date!"
    exit 0
fi
