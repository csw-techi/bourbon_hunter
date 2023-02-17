# Bourbon Hunter Script

## Install / Setup

1. Clone bourbon_hunter repo https://github.com/csw-techi/bourbon_hunter
2. Install Docker https://docs.docker.com/get-docker/
3. Install serverless framework https://www.serverless.com/framework/docs/getting-started
4. Create Twilio Account https://www.twilio.com/try-twilio
5. Configure AWS CLI https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-quickstart.html
6. Run 'npm install'
7. Run 'bundle install --standalone --path vendor/bundle'  <!-- Maybe just 'bundle install' -->
8. Add phone numbers to handler.rb e.g. numbers_to_message = ['5025551234', '8125551234']
   
## Invoking Locally

    docker build -t awsruby27 .
    
    docker run --rm -it -v $PWD:/var/task -w /var/task awsruby27
    
    bundle install --path vendor/bundle --clean

    export BUCKET_NAME=<AWS S3 bucket name here>
    export ACCOUNT_SID=<Twilio SID here>
    export AUTH_TOKEN=<Twilio auth tokern here>
    export TWILIO_NUMBER=<Twilio number here>

    ruby -e "require 'handler'; puts site_scraper(event: nil, context: nil)"

## Deploying

    export BUCKET_NAME=<AWS S3 bucket name here>
    export ACCOUNT_SID=<Twilio SID here>
    export AUTH_TOKEN=<Twilio auth tokern here>
    export TWILIO_NUMBER=<Twilio number here>

    rm -f deploy.zip ; zip -q -r bourbon-hunter-deploy.zip .

    serverless deploy --stage prd

## Other Links

-  [The quickest & easiest way to develop AWS Lambda functions that use Ruby gems](https://blog.pardner.com/2021/03/the-quickest-easiest-way-to-develop-aws-lambda-functions-that-use-ruby-gems/)