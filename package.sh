#!/bin/sh

if [ -z "$1" ]; then
    echo "Error: Please provide Electron version as argument"
    echo "Usage: $0 <version>"
    echo "Example: $0 v35.1.3"
    exit 1
fi

VERSION=$1
ZIP_FILE="electron-${VERSION}-darwin-arm64.zip"

rm -rf ./dist
rm -f *.zip
mkdir -p ./dist
curl -L -o "./${ZIP_FILE}" "https://github.com/electron/electron/releases/download/${VERSION}/${ZIP_FILE}"
unzip -o "./${ZIP_FILE}" -d ./dist/
mkdir -p ./dist/Electron.app/Contents/Resources/app/
cp package.json ./dist/Electron.app/Contents/Resources/app/
cp index.js ./dist/Electron.app/Contents/Resources/app/
cp index.html ./dist/Electron.app/Contents/Resources/app/
