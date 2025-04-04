#!/bin/sh
rm -rf ./dist ./electron-v35.1.3-darwin-arm64.zip
mkdir -p ./dist
curl -L -o ./electron-v35.1.3-darwin-arm64.zip https://github.com/electron/electron/releases/download/v35.1.3/electron-v35.1.3-darwin-arm64.zip
unzip -o ./electron-v35.1.3-darwin-arm64.zip -d ./dist/
mkdir -p ./dist/Electron.app/Contents/Resources/app/
cp package.json ./dist/Electron.app/Contents/Resources/app/
cp index.js ./dist/Electron.app/Contents/Resources/app/
cp index.html ./dist/Electron.app/Contents/Resources/app/
