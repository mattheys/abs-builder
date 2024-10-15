#!/bin/bash

if [ "$ACCEPT_LICENSE" != "Y" ]
then
    echo "Cannot continue without accepting the Android SDK licenses"
    exit 1
fi

git clone -b $GIT_BRANCH --depth 1 $GIT_REPO ./src || git -C ./src pull

cd src

npm ci
npm run generate
npx cap sync
yes | sdkmanager --licenses

./android/gradlew assembleDebug -p android --no-daemon

build="$(date +%Y%m%d-%H%M%S)-$(git rev-parse --short HEAD)"
name="audiobookshelf-${build}.apk"
mv -v ./android/app/build/outputs/apk/debug/app-debug.apk "/output/${name}"
