FROM node:20

ENV ANDROID_HOME=/usr/lib/android-sdk
ENV ACCEPT_LICENSE=N
ENV GIT_REPO=https://github.com/advplyr/audiobookshelf-app.git
ENV GIT_BRANCH=master

WORKDIR /build

RUN apt update && apt install git default-jre android-sdk sdkmanager -y
RUN sdkmanager "platform-tools" "platforms;android-34" "build-tools;33.0.1"

COPY run.sh run.sh
RUN chmod +x run.sh

ENTRYPOINT [ "./run.sh" ]
