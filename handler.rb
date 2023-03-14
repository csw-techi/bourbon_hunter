require 'rubygems'
require 'nokogiri'
require 'twilio-ruby'
require 'open-uri'

AVAILABLE_PRODUCT_CSS_SELECTOR = '.container.section.container--justify-center.container--product-availability-available.aem-GridColumn--offset--tablet--0.aem-GridColumn--default--none.aem-GridColumn--phone--none.aem-GridColumn--phone--12.aem-GridColumn--tablet--none.aem-GridColumn.aem-GridColumn--tablet--6.aem-GridColumn--offset--phone--0.aem-GridColumn--offset--default--0.aem-GridColumn--default--4'

  def site_scraper(event:, context:)
    html = URI.open('https://www.buffalotracedistillery.com/product-availability').read
    nokogiri_doc = Nokogiri::HTML(html)
    final_array = []

      list = ['🥃 Hello from Bourbon Hunter!','Available today at Buffalo Trace']

    nokogiri_doc.search(AVAILABLE_PRODUCT_CSS_SELECTOR).each do |element|
      element = element.search('.cmp-title h3').text
      final_array << element

    end
      final_array.each_with_index do |element, index|
        output = "#{index + 1} - #{element}"
        list << output
        end
          bt_url = 'Reply STOP to unsubscribe https://www.buffalotracedistillery.com/product-availability'

          list << bt_url
          
          account_sid = ENV['ACCOUNT_SID']
          auth_token = ENV['AUTH_TOKEN']
          twilio_number = ENV['TWILIO_NUMBER']
          numbers_to_message = ['<phone number here>','<phone number here>']

          @client = Twilio::REST::Client.new(account_sid, auth_token)
          
          numbers_to_message.each do |number|
            message = @client.messages
              .create(
                  body: list.join("\n"),
                  from: twilio_number,
                  media_url: ['https://www.buffalotracedistillery.com/content/dam/sazerac/final/north-america/homeplaces/buffalo-trace-distillery/images/distillery-grounds/our-story-1950-2000-footer.jpg'],
                  to: number
                )
            end
        puts list
    end