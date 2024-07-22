#!/bin/bash
set -ex

IFS='.' read -ra VER_ARR <<< "$PKG_VERSION"

# temporary prefix to be able to install files more granularly
mkdir temp_prefix

# default SOVER for tagged releases is just the major version
SOVER_EXT=${VER_ARR[0]}
if [[ "${PKG_VERSION}" == *rc* ]]; then
    # rc's get "rc" without the number
    SOVER_EXT="${SOVER_EXT}rc"
elif [[ "${PKG_VERSION}" == *dev0 ]]; then
    # otherwise with git suffix
    SOVER_EXT="${SOVER_EXT}git"
fi

cmake --install ./build --prefix=$PREFIX

echo "Tree for \$PREFIX=$PREFIX..."
tree "$PREFIX"

rm -rf temp_prefix
