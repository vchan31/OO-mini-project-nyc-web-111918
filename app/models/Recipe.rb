class Recipe
attr_reader :name

@@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def recipe_card
    RecipeCard.all.select do |recipecard|
      recipecard.recipe == self
    end
  end

  def users

    self.recipe_card.map do |recipe_card|
      recipe_card.user
    end

  end


  def self.most_popular


    users = self.all.map do |recipe|
      recipe.users

    end
    recipe_array =  users.flatten.map do |user|
      user.recipes

    end
    recipe_array.flatten.each_with_object(Hash.new(0)){ |m,h| h[m] += 1 }.sort_by{ |k,v| v }[-1][0]
  end

  def recipe_ingredients
    RecipeIngredient.all.select do |recipe_ingredient|
      recipe_ingredient.recipe == self
    end
  end

  def ingredients
    self.recipe_ingredients.map do |recipe_ingredient|
      recipe_ingredient.ingredient
    end
    end

    def allergens
      self.ingredients.select do |ingredient|
        Allergen.ingredients.include? (ingredient)
        #need helper method to get array of ingredients in Allergen class
    #  Allergen.all.select do |allergen|
      #  self.ingredients.include? (allergen.ingredient)
        end
      end

      def add_ingredients (ingredients_array)
        ingredients_array.each do |ingredient|
          RecipeIngredient.new(self, ingredient)
        end
      end
end
