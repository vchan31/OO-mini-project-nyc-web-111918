require_relative '../config/environment.rb'


i1 = Ingredient.new("bean sprout")
i2 = Ingredient.new("lemon")
i3 = Ingredient.new("turtle")

u1 = User.new("Vincent")
u2 = User.new("Isaac")
u3 = User.new("Adam")

r1 = Recipe.new("Pie")
r2 = Recipe.new("Turtle soup")
r3 = Recipe.new("Government Cheese")


#(name, user, ingredient)
a1 = Allergen.new(u1, i1)
a2 = Allergen.new(u3, i3)
a3 = Allergen.new(u2, i2)


#(name, receipe, ingredient)
ri1 = RecipeIngredient.new(r1,i1)
ri2 = RecipeIngredient.new(r2,i1)
ri3 = RecipeIngredient.new(r3,i3)

  #name, user, recipe
rc1 = RecipeCard.new(u1, r2, 5, Time.new(2000))
rc2 =  RecipeCard.new(u2, r2)
rc3 = RecipeCard.new(u1, r1)
binding.pry
