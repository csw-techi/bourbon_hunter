require 'open-uri'
require 'nokogiri'
require 'csv'

  def scraping(url)
    html = URI.open("#{url}").read
    nokogiri_doc = Nokogiri::HTML(html)
    final_array = []

    nokogiri_doc.search(".cmp-title h3").each do |element|
      element = element.text
      final_array << element
    end
      final_array.each_with_index do |element, index|
        puts "#{index + 1} - #{element}"
    end
  end

scraping('https://www.buffalotracedistillery.com/product-availability')