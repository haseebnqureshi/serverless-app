#!/bin/bash

function libExists {
	return [ -f lib ] && [ -f lib/package.json ]
}

function libLink {
	cd lib
	npm link
	cd ..
}

# continue only if we have a shared lib folder with a package.json
if [ ! libExists ] 
then
	echo "Lib doesn't exist! Carrying on..."
	exit;
fi

# npm link our lib for shared use between services
echo "npm link our shared lib..."
libLink

# this gets called on npm install on this repo, for easier startup to local dev
for service in */
do
	cd "$service"
	for serviceFile in *
	do
		if [[ "$serviceFile" == *"serverless.y"* ]]
		then
			echo "Found serverless service at $service - linking shared lib..."
			npm link lib
		fi
	done	
	cd ..
done