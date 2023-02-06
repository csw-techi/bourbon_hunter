load "vendor/bundle/bundler/setup.rb"

require 'rubygems'
require 'open-uri'
require 'nokogiri'
require 'twilio-ruby'
require 'date'

# We only care about available products
AVAILABLE_PRODUCT_CSS_SELECTOR = '.container.section.container--justify-center.container--product-availability-available.aem-GridColumn--offset--tablet--0.aem-GridColumn--default--none.aem-GridColumn--phone--none.aem-GridColumn--phone--12.aem-GridColumn--tablet--none.aem-GridColumn.aem-GridColumn--tablet--6.aem-GridColumn--offset--phone--0.aem-GridColumn--offset--default--0.aem-GridColumn--default--4'

  def site_scraper(event:, context:)
    html = URI.open('https://www.buffalotracedistillery.com/product-availability').read
    nokogiri_doc = Nokogiri::HTML(html)
    final_array = []
    d = DateTime.now
    date = d.strftime("%m/%d/%Y %H:%M")

    list = [date,'Hello from Bourbon Hunter!','In stock today at Buffalo Trace']

    nokogiri_doc.search(AVAILABLE_PRODUCT_CSS_SELECTOR).each do |element|
      element = element.search('.cmp-title h3').text
      final_array << element
    end
      final_array.each_with_index do |element, index|
        output = "#{index + 1} - #{element}"
        list << output
        end
          account_sid = ENV['ACCOUNT_SID']
          auth_token = ENV['AUTH_TOKEN']
          twilio_number = ENV['TWILIO_NUMBER']
          to_numbers = ENV['TO_NUMBERS']

          @client = Twilio::REST::Client.new(account_sid, auth_token)

          message = @client.messages
            .create(
              body: list.join("\n"),
              from: twilio_number,
              media_url: ['https://www.buffalotracedistillery.com/visit-us/tasting-and-purchasing/product-availability/_jcr_content/root/container/container_62029901/image.coreimg.100.900.jpeg/1631722971487/gift-shop-spirits-39.jpeg'],
              to: to_numbers
            )

          #puts message.sid
        puts list
    end
