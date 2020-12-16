require 'open-uri'

puts "destroy cocktail"
Cocktail.destroy_all
puts "destroy ingredients"
Ingredient.destroy_all

puts "create ingredients"
a = []
url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
ingredients_serialized = open(url).read
ingredients = JSON.parse(ingredients_serialized)
ingredients["drinks"].map do |element|
  a << element["strIngredient1"]
end

a.each do |element|
  Ingredient.create!(name: "#{element}")
end

Ingredient.create!(name: "lemon")
Ingredient.create!(name: "ice")
Ingredient.create!(name: "mint leaves")

puts "create cocktails"
mojito = Cocktail.create!(name: "Mojito")
cuba_libre = Cocktail.create!(name: "Cuba Libre")
ti_punch = Cocktail.create!(name: "Ti Punch")
sex_on_the_beach = Cocktail.create!(name: "Sex on the Beach")
planteur = Cocktail.create!(name: "Planteur")

file = URI.open('https://images.unsplash.com/photo-1513558161293-cdaf765ed2fd?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80.jpg')
mojito.photo.attach(io: file, filename: 'mojito.png', content_type: 'image/png')

file = URI.open('https://images.unsplash.com/photo-1589190859807-21bc5319b653?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80.jpg')
cuba_libre.photo.attach(io: file, filename: 'cuba_libre.png', content_type: 'image/png')

file = URI.open('https://images.unsplash.com/photo-1599021456807-25db0f974333?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=679&q=80.jpg')
ti_punch.photo.attach(io: file, filename: 'ti_punch.png', content_type: 'image/png')

file = URI.open('https://images.unsplash.com/photo-1536935338788-846bb9981813?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=986&q=80.jpg')
sex_on_the_beach.photo.attach(io: file, filename: 'sex_on_the_beach.png', content_type: 'image/png')

file = URI.open('https://images.unsplash.com/photo-1549746423-e5fe9cafded8?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80.jpg')
planteur.photo.attach(io: file, filename: 'planteur.png', content_type: 'image/png')

