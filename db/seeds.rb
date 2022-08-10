shoes_data = JSON.parse(File.read('app/assets/data/shoes.json'))["shoes"]

shoes_data.each do |shoe_data|
  Shoe.create(
    image: shoe_data["image"],
    name: shoe_data["name"],
    description: shoe_data["description"],
    price: shoe_data["price"],
    color: shoe_data["color"]
  )
end

Cart.create()
