#!/bin/bash

function removeServices {

	for service in */
	do
		cd "$service"
		for serviceFile in *
		do
			if [[ "$serviceFile" == *"serverless.y"* ]]
			then
				echo "Found serverless service at $service - removing service..."
				sls remove
			fi
		done	
		cd ..
	done
}


# recursively removes all services in your project!
removeServices
