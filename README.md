## sample-serverless-webapp
Sample webapp to demonstrate serverless concepts

## Overview
This is a project that provides you everything you need to quickly create your own serverless website within AWS. The website consists of S3, Cognito, API Gateway, and DynamoDB

Table of Contents
----------------
* [Overview](#overview)
* [Requirements](#requirements)
* [Steps for Setting Up](#steps-for-setting-up)
  - [Create S3 Bucket](#create-s3-bucket)
  - [Create Cognito](#create-cognito)
  - [Create API Endpoint](#create-api-endpoint)
  - [Configure Website](#configure-website)
  - [Create Website](#create-website)
* [Cleaning Up](#cleaning-up)

## Requirements
* [install AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-install.html)
* [install Terraform](https://www.terraform.io/downloads.html)
* [install Node/NPM](https://nodejs.org/en/)
* [install Serverless](https://serverless.com/framework/docs/getting-started/)

## Steps for setting up
### Create S3 Bucket
* From the root of the project (e.g., ~/sample-serverless-webapp)
  - `cd infrastructure/s3-bucket`
  - `terraform init`
  - `terraform plan`
  - `terraform apply -var 'bucket_name=<bucket_name>'`
* Take note of the two variables (bucket_name & website_endpoint) printed out by terraform

### Create Cognito 
* From the root of the project (e.g., ~/sample-serverless-webapp)
  - `cd infrastructure/cognito`
  - `terraform init`
  - `terraform plan`
  - `terraform apply -var 'cognito_pool=<cognito_pool_name>' -var 'webapp_name=<webapp_name>'`
* Take note of the three variables (cognito_pool, cognito_pool_client, and cognito_pool_arn) printed out by terraform

### Create API Endpoint
* From the root of the project (e.g., ~/sample-serverless-webapp)
  - `cd infrastructure/api-gateway`
  - install the project requirements
    - npm i serverless-python-requirements
  - edit serverless.yml
    - Add the arn to the create function where it mentions 'authorizer'
  - `sls deploy --api_name <api_name>`
* Take note of the API Endpoints provided by serverless (e.g., 'hxxps://8wonhgpbu3.execute-api.us-east-1.amazonaws.com/dev/notes')

### Configure Website
* From the root of the project (e.g., ~/sample-serverless-webapp)
  - `cd website/src/`
  - edit main.js
    - In the section Amplify.configure insert the following: region, userPoolId, and userPoolWebClientId
    - save and exit main.js
  - edit config.js
    - Insert your API Endpoint into the baseURI
    - save and exit config.js
    
### Create Website
* From within the website directory
  - execute `npm run build`
  - this will create a 'dist' directory
* Copy the contents of the 'dist' directory into your S3 bucket
  - `aws s3 cp --recursive ~/sample-serverless-webapp/website/dist s3://<bucket_name>` 
* Now go to your website (refer back to the bucket_domain that you took note of)


## Cleaning Up
* Go back into the s3-bucket directory
  - `aws s3 rm s3://<bucket_name> --recursive`
  - `'terraform destroy -auto-approve'`
* Go back into the cognito directory and execute `'terraform destroy -auto-approve'`
* Go back into the api-gateway directory and execute `'sls remove --api_name <api_name>'`
