# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require 'json'
require 'open-uri'
require 'faker'

url ='https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
json_cocktails = open(url).read
cocktails = JSON.parse(json_cocktails)
cocktails_list = cocktails["drinks"]

cocktails_list.each do |ingredient|
  Ingredient.create(name: ingredient["strIngredient1"])
end

url = 'http://www.thecocktaildb.com/api/json/v1/1/filter.php?i=Vodka'
json_image = open(url).read
image = JSON.parse(json_image)
image_list = image["drinks"]

image_list.each do |cocktail|
  cocktail_name = Cocktail.new(name: cocktail["strDrink"]), img_url: cocktail["strDrinkThumb"])
  Dose.create(
    description: Faker::Cannabis.strain
    cocktail: cocktail_name,
    ingredient: Ingredient.all.sample
  )
end