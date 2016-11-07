
# serverless-app
Serverless framework example for launching a basic front-end app.

## Explanation
This creates 2 additional S3 buckets, both configured for static website hosting through S3. One will actually contain your files, and the other handles your www. prefix requests, routing them to the non-www bucket. 

## Quick Installation

1. Go to ```config.yml``` in the repo's root directory. Change whatever you need to change there. These settings are then used by each service below for full consistency.

2. For local development, run ```npm install``` in the repo's root directory. This will install any dev dependency (like ```serverless-offline```).

3. That's it!

## Deployment
Once you're ready to deploy your www directory for static website hosting, simply:

1. Run ```npm run-script deploy``` in this repo's main directory. This will create all of your necessary AWS resources.

2. Then run ```npm run-script sync```. You've just now uploaded the entire ```www``` directory onto S3 for static website hosting!

## Useful Commands
To make full application ```deploy``` and ```remove``` simple, I've boiled them down to these two ```npm scripts``` that you can easily run:

- Run ```npm run-script info``` to ```sls info``` every service contained, getting a rundown of your app as a whole
- Run ```npm run-script deploy``` to ```sls deploy``` every service contained
- Run ```npm run-script remove``` to ```sls remove``` every service contained
