class HomesController < ApplicationController
  def index 
    @shoes = Shoe.all
  end
end
