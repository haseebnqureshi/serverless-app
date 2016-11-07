#!/bin/bash

function infoServices {

	for service in */
	do
		cd "$service"
		for serviceFile in *
		do
			if [[ "$serviceFile" == *"serverless.y"* ]]
			then
				echo "Found serverless service at $service..."
				sls info
			fi
		done	
		cd ..
	done
}


# recursively displays info for each service in your project!
infoServices
