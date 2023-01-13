require 'open-uri'
require 'nokogiri'
require 'csv'

# We only care about available products
AVAILABLE_PRODUCT_CSS_SELECTOR = '.container.section.container--justify-center.container--product-availability-available.aem-GridColumn--offset--tablet--0.aem-GridColumn--default--none.aem-GridColumn--phone--none.aem-GridColumn--phone--12.aem-GridColumn--tablet--none.aem-GridColumn.aem-GridColumn--tablet--6.aem-GridColumn--offset--phone--0.aem-GridColumn--offset--default--0.aem-GridColumn--default--4'

  def scraping(url)
    html = URI.open("#{url}").read
    nokogiri_doc = Nokogiri::HTML(html)
    final_array = []

    nokogiri_doc.search(AVAILABLE_PRODUCT_CSS_SELECTOR).each do |element|
      element = element.search('.cmp-title h3').text
      final_array << element
    end
      final_array.each_with_index do |element, index|
        puts "#{index + 1} - #{element}"
    end
  end

scraping('https://www.buffalotracedistillery.com/product-availability')
