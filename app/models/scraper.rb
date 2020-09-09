require 'nokogiri'
require 'open-uri'

class Scraper

  codes_list_url = 'https://www.hoggo.com/code-ape-naf'

  html = open(codes_list_url)

  doc = Nokogiri::HTML(html)

  table = doc.search('table')
  codes_rows = table.css('tr')

  codes_list = []
  codes_rows.each do |row|
    cells_array = []
    row.css('td').each do |td|
      cells_array << td.text
    end
    ape_code = cells_array[0]
    codes_list << ape_code
  end

  codes_list.delete_at(0)
  p codes_list
end


scrape = Scraper.new

