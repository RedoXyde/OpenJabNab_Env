#!/bin/sh

# CONFIGURE ME !
  # Parallel Build jobs
jobs=4
  # Server sources folder
srcFolder=OpenJabNab/server/
  # Build folder
buildFolder=build/
  # Output folder (not used yet)
outFolder=bin/
  # Install folder (not used yet)
installFolder=install/

# CMake options
cmakeFlags="-DCMAKE_BUILD_TYPE=RelWithDebInfo"
#cmakeFlags="$cmakeFlags -DBUILD_TESTS=1"
#cmakeFlags="$cmakeFlags -DCMAKE_INSTALL_PREFIX=$installFolder"
# Build options
buildFlags="-j$jobs"

# Run CMake !
cmakeRet=0
if [ ! -f $buildFolder/CMakeCache.txt ]; then
  cmake -B $buildFolder $cmakeFlags $srcFolder
  cmakeRet=$?
fi
if [ $cmakeRet != 0 ]; then
  echo "CMake Failed =("
  exit 1
fi

# Build !
make -C $buildFolder $buildFlags
if [ $? != 0 ]; then
  echo "Build Failed =("
  exit 1
fi

# Install
#make -C $buildFolder $buildFlags install
#if [ $? != 0 ]; then
#  echo "Install Failed =("
#  exit 1
#fi

echo "Great success !"
exit 0