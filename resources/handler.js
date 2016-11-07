'use strict';

const exec = require('child_process').execSync;
const path = require('path');
const yaml = require('js-yaml');
const fs = require('fs');

module.exports.sync = (event, context, callback) => {

	/*
	IMPORTANT: You must invoke sync locally! When you deploy this
	resources service, no www files are contained in your lambda
	function. That's why you locally invoke, so that your local
	machine can grab your www files, and sync them to your s3 
	bucket. 

	NOTE: We're doing this through a SLS function instead of a
	npm command, so we get easy access to our SLS config variables.
	*/

	let sourceDirpath = path.resolve( __dirname, '../www' );
	let yamlFilepath = path.resolve( __dirname, '../config.yml' );
	let config;

	//safely try and load yml, otherwise we error out
	try {
		config = yaml.safeLoad( fs.readFileSync(yamlFilepath, 'utf8') );
	}
	catch (err) {
		throw 'Looks like you\'re running this in lambda. Invoke your function locally and it\'ll be all fine!';
	}

	let command = `aws s3 sync ${sourceDirpath} s3://${config.staticBucketName} --profile=${config.awsProfile}`;

	console.warn('About to sync local www directory to S3...');
	exec(command);
	console.info('Finished syncing to S3!');

};
