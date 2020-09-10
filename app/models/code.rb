require 'csv'

class Code < ApplicationRecord

  include PgSearch::Model
  pg_search_scope :search_by_code_digits_and_name,
    against: [ :code_digits, :name ],
    using: {
      tsearch: { prefix: true}
    }

  def self.create_from_collection(codes)
    codes.each do |code_hash|
      Code.create(code_hash)
    end
  end

  def self.export_to_csv
    headers = ["Numéro APE", "Nom", "Inclus dans la classe", "Non inclus dans la classe"]
    file = "#{Rails.root}/public/code_data.csv"
    codes = Code.all
    CSV.open(file, 'w', headers: true) do |csv|
      csv << headers
      codes.each do |code|
        csv << [code.code_digits, code.name, code.included, code.not_included]
      end
    end
  end



end
