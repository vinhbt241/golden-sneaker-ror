class HomesController < ApplicationController
  def index 
    @shoes_data = JSON.parse(File.read('app/assets/data/shoes.json'))["shoes"]
  end
end
