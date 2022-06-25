#!/bin/bash
# Script to clone the JuliaSmoothOptimizers main repo and get the necessary folders
wget https://github.com/JuliaSmoothOptimizers/JuliaSmoothOptimizers.github.io/archive/refs/heads/main.zip
unzip main.zip
if [ -z "$CI" ]; then
  rm -rf _assets _layout _libs _sass
  mv -f JuliaSmoothOptimizers.github.io-main/{_assets,_layout,_sass,_libs,package.json,config.md,utils.jl} .
else
  mv -f JuliaSmoothOptimizers.github.io-main/{_layout,_libs,_sass,package.json,config.md,utils.jl} .
fi
rm -rf JuliaSmoothOptimizers.github.io-main main.zip