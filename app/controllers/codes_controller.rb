class CodesController < ApplicationController

  def index
    if params[:query].present?
      @codes = Code.all.search_by_code_digits_and_name(params[:query])
    else
      @codes = Code.all
    end
  end

end
