#!/bin/sh
# --------------------------------------------------------------------------
# buildscript for osx 32/64
# --------------------------------------------------------------------------
# Processing Library for the Dynamixel Servo
# http://code.google.com/p/simple-dynamixel
# --------------------------------------------------------------------------
# prog:  Max Rheiner / Interaction Design / Zhdk / http://iad.zhdk.ch/
# date:  08/12/2012 (m/d/y)
# upd:   George Profenza
# date:	 05/08/2017 (m/d/y)
# ----------------------------------------------------------------------------
# Change those vars to the folders you have on your system:
#	-DBOOST_ROOT 		= folder of Boost root
#	-DP5_JAR 		= filepath to your core.jar (Processing)
#	-SWIG version 2.0.12 is required (brew install homebrew/versions/swig2)
# ----------------------------------------------------------------------------


# optional, but gives a clean build
rm -r build

# check if build folder exists
if [ ! -d "build" ]; then
    mkdir build
fi

cd ./build

# P5=/Users/George/Downloads/ProcessingDNLD/processing-3.2.3-macosx/Processing3.2.3.app
P5=/Applications/Processing.app

echo "--- generate cmake ---"
cmake -DCMAKE_BUILD_TYPE=Release \
	  -DP5_JAR=$P5/Contents/Resources/Java/core.jar \
          -DP5_JAR_SERIAL=$P5/Contents/Resources/Java/modes/java/libraries/serial/library/serial.jar \
          -DCMAKE_OSX_ARCHITECTURES="i386;x86_64" \
          -DUSE_ASIO=1 \
          ..


echo "--- build ---"
# build with 8 threads, verbose is optional, but otherwise you can't see the compiler directives
make -j 8 VERBOSE=1


echo "--- copy ---"
# copy the library
cp SimpleDynamixel.jar ../dist/all/SimpleDynamixel/library
cp libSimpleDynamixel.jnilib ../dist/all/SimpleDynamixel/library

# copy the doc
cp -r ./doc/* ../dist/all/SimpleDynamixel/documentation/
