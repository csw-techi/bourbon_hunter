# Bourbon Hunter Script

## Install / Setup

0. Clone bourbon_hunter repo https://github.com/csw-techi/bourbon_hunter
1. Install Docker https://docs.docker.com/get-docker/
2. Install serverless framework https://www.serverless.com/framework/docs/getting-started
3. Create Twilio Account https://www.twilio.com/try-twilio
3. Run 'npm install'
4. Run 'bundle install --standalone --path vendor/bundle'
    <!--Maybe just 'bundle install' ??  -->


## Invoking Locally

    docker build -t awsruby27 .
    
    docker run --rm -it -v $PWD:/var/task -w /var/task awsruby27
    
    bundle install --path vendor/bundle --clean
    
    export BUCKET_NAME=<AWS S3 bucket name here>
    export ACCOUNT_SID=<Twilio SID here>
    export AUTH_TOKEN=<Twilio auth tokern here>
    export TWILIO_NUMBER=<Twilio number here>
    export TO_NUMBERS=<Destination SMS numbers here seperated by commas>

    ruby -e "require 'handler'; puts site_scraper(event: nil, context: nil)"

## Deploying

    export BUCKET_NAME=<AWS S3 bucket name here>
    export ACCOUNT_SID=<Twilio SID here>
    export AUTH_TOKEN=<Twilio auth tokern here>
    export TWILIO_NUMBER=<Twilio number here>
    export TO_NUMBERS=<Destination SMS numbers here seperated by commas>

    rm -f deploy.zip ; zip -q -r bourbon-hunter-deploy.zip .

    serverless deploy --stage prd

## Other Links

-  [The quickest & easiest way to develop AWS Lambda functions that use Ruby gems](https://blog.pardner.com/2021/03/the-quickest-easiest-way-to-develop-aws-lambda-functions-that-use-ruby-gems/)