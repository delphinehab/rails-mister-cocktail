# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
a = []
url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
ingredients_serialized = open(url).read
ingredients = JSON.parse(ingredients_serialized)
ingredients["drinks"].map do |element|
  a << element["strIngredient1"]
end

a.each do |element|
  Ingredient.create(name: "#{element}")
end

Ingredient.create(name: "lemon")
Ingredient.create(name: "ice")
Ingredient.create(name: "mint leaves")

Cocktail.create(name: "Mojito", photo: )
Cocktail.create(name: "Cuba Libre")
Cocktail.create(name: "Ti Punch")
Cocktail.create(name: "Sex on the Beach")
Cocktail.create(name: "Planteur")

