#!/bin/bash
#
# Build all Python images image from the currently checked out version and
# push them it to the Docker Hub.

for version in 16
do
	pushd "$(dirname "${BASH_SOURCE[0]}")/${version}/"
	echo "Building ${version}..."
	docker build -t metabrainz/node:${version} .
	if [ "$?" -eq 0 ]; then
		echo "Pushing ${version}..."
		docker push metabrainz/node:${version}
	else
		echo "Building image failed, skipping pushing image to Docker Hub"
	fi
	popd
done

echo "Done!"
