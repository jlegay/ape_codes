require 'nokogiri'
require 'open-uri'

class Scraper

  def scrape_codes_urls

    # Get ape codes list on Hoggo website

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

    #Clean ape codes list for re-use

    codes_list.delete_at(0)

    codes_list_formatted = []

    codes_list.each do |code|
      splitted_code = code.split("")
      formatted_code = "#{splitted_code[0]}#{splitted_code[1]}.#{splitted_code[2]}#{splitted_code[3]}#{splitted_code[4]}"
      codes_list_formatted << formatted_code
    end

    # Get ape codes information on Insee website

    codes_infos_array = []

    codes_list_formatted.each do |code|
      insee_url = "https://www.insee.fr/fr/metadonnees/nafr2/sousClasse/#{code}?champRecherche=false"
      insee_html = open(insee_url)
      insee_doc = Nokogiri::HTML(insee_html)
      code_name = insee_doc.css('.titre-principal').text.split(" : ")[1]
      code_included = insee_doc.css('.comprend').css('.list1')
      code_not_included = insee_doc.css('.comprend-pas').css('.list1')
      new_code = { code_digits: code, name: code_name, included: code_included, not_included: code_not_included }
      codes_infos_array << new_code
    end

    return codes_infos_array

  end

end

