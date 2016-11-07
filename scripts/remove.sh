#!/bin/bash

# run this script to completely remove all services!
for service in */ ; do
	echo "Attempting to remove service located in \"$service\"..."
	cd "$service"
	sls remove
	cd ..
done
