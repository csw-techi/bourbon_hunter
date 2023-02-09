# Bourbon Hunter Script

## Install / Setup

0. Clone bourbon_hunter repo https://github.com/csw-techi/bourbon_hunter
1. Install Docker https://docs.docker.com/get-docker/
2. Install serverless framework https://www.serverless.com/framework/docs/getting-started
3. Create Twilio Account https://www.twilio.com/try-twilio
3. 'npm install'
4. 'bundle install --standalone --path vendor/bundle'

## Invoking Locally

    
    
    
    export TWILIO_ACCOUNT_SID=<Twilio SID here>
    export TWILIO_AUTH_TOKEN=<Twilio auth tokern here>

     serverless invoke local --docker --stage prd --region us-east-1 --function bourbon_hunter

    bundle install --path vendor/bundle --clean
    ruby -e "require 'handler'; puts site_scraper(event: nil, context: nil)"
    rm -f deploy.zip ; zip -q -r bourbon-hunter-deploy.zip .
https://blog.pardner.com/2021/03/the-quickest-easiest-way-to-develop-aws-lambda-functions-that-use-ruby-gems/
          
NOTES:        
export ACCOUNT_SID='AC2fa881916ef7e57601cc8b6c501dcbb1'
export AUTH_TOKEN='7d17eb85b93a8b903a7b02e6ac4279d1'
export TWILIO_NUMBER='8559175205'
export TO_NUMBERS='5028190532'

          account_sid = ENV['ACCOUNT_SID']
          auth_token = ENV['AUTH_TOKEN']
          twilio_number = ENV['TWILIO_NUMBER']
          to_numbers = ENV['TO_NUMBERS']

          