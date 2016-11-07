#!/bin/bash

# run this script to get sls info of all your services
for service in */ ; do
	cd "$service"
	sls info
	cd ..
done
