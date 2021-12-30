#!/bin/bash
# Script to clone the jso-docs main repo and get the necessary folders
wget https://github.com/jso-docs/jso-docs.github.io/archive/refs/heads/main.zip
unzip main.zip
mv -f jso-docs.github.io-main/{_assets,_layout,_sass,_libs,config.md,package.json,utils.jl} .
rm -rf jso-docs.github.io-main main.zip