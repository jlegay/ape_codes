class Code < ApplicationRecord


  def self.create_from_collection(codes)
    codes.each do |code_hash|
      Code.create(code_hash)
    end
  end

end
