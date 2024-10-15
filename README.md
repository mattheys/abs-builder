# AudioBookShelf Android App builder

This is a Docker build environment for the Android AudioBookShelf App

You must accept the Android SDK licenses by using the environment variable ACCEPT_LICENSE=Y

Other environemnt variables are $GIT_REPO and $GIT_BRANCH if you wish to build a fork instead of the offical branch.

I've published this on Docker Hub at mheys1/abs-builder:latest

Suggested use would be to create the container first, then start it to build, this should pull each time it starts and keep up to date.  This approach means that you won't be installing npm dependencies and gradle repeatidly.

`docker create --name builder -e ACCEPT_LICENSE=Y -v ./:/output mheys1/abs-builder:latest`

`docker start builder && docker logs -f --tail 0 builder`

This is a quite niave approach so if anyone has better ideas, please open an Issue or Pull request.
