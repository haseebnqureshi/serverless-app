#!/bin/bash

function deployServices {

	for service in */
	do
		cd "$service"
		for serviceFile in *
		do
			if [[ "$serviceFile" == *"serverless.y"* ]]
			then
				echo "Found serverless service at $service - deploying service..."
				sls deploy
			fi
		done	
		cd ..
	done
}


# recursively deploys all services in your project!
deployServices
