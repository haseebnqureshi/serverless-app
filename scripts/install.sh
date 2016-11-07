#!/bin/bash

function libLink {
	cd lib
	npm link
	cd ..
}

function npmLinkServices {

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
}

function npmInstallServices {

	for service in */
	do
		cd "$service"
		for serviceFile in *
		do
			if [[ "$serviceFile" == *"package.json"* ]]
			then
				echo "Found npm package.json - npm install..."
				npm install
			fi
		done	
		cd ..
	done
}

# npm install our services
npmInstallServices

# if shared lib folder exists, we npm link our services
if [ ! -f lib ] && [ -f lib/package.json ]
then
	npmLinkServices
fi
