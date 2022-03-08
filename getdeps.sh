#!/bin/bash
# Script to clone the jso-docs main repo and get the necessary folders
wget https://github.com/jso-docs/jso-docs.github.io/archive/refs/heads/main.zip
unzip main.zip
if [ -z "$CI" ]; then
  rm -rf _assets _layout _libs _sass
  mv -f jso-docs.github.io-main/{_assets,_layout,_sass,_libs,package.json,config.md,utils.jl} .
else
  mv -f jso-docs.github.io-main/{_layout,_libs,_sass,package.json,config.md,utils.jl} .
fi
rm -rf jso-docs.github.io-main main.zip