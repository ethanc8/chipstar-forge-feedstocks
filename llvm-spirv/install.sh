#!/bin/bash
echo "Using package version $PKG_VERSION..."
set -x
cd build
make install
mv ${PREFIX}/bin/llvm-spirv ${PREFIX}/bin/llvm-spirv-${PKG_VERSION%%.*}
ln -sf ${PREFIX}/bin/llvm-spirv-${PKG_VERSION%%.*} ${PREFIX}/bin/llvm-spirv
