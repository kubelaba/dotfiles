#!/bin/sh
set -e

on_exit () {
	[ $? -eq 0 ] && exit
	echo 'ERROR: Feature "Azure CLI" (ghcr.io/devcontainers/features/azure-cli) failed to install! Look at the documentation at ${documentation} for help troubleshooting this error.'
}

trap on_exit EXIT

set -a
. ../devcontainer-features.builtin.env
. ./devcontainer-features.env
set +a

echo ===========================================================================

echo 'Feature       : Azure CLI'
echo 'Description   : Installs the Azure CLI along with needed dependencies. Useful for base Dockerfiles that often are missing required install dependencies like gpg.'
echo 'Id            : ghcr.io/devcontainers/features/azure-cli'
echo 'Version       : 1.2.9'
echo 'Documentation : https://github.com/devcontainers/features/tree/main/src/azure-cli'
echo 'Options       :'
echo '    BICEPVERSION="latest"
    EXTENSIONS=""
    INSTALLBICEP="false"
    INSTALLUSINGPYTHON="false"
    VERSION="latest"'
echo 'Environment   :'
printenv
echo ===========================================================================

chmod +x ./install.sh
./install.sh
