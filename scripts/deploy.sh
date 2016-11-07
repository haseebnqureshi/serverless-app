#!/bin/bash

# run this script to freshly deploy all services herein!
for service in */ ; do
	echo "Attempting to deploy service located in \"$service\"..."
	cd "$service"
	sls deploy
	cd ..
done
