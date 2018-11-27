class User
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
        recipecard.user == self
      end
    end

    def recipes
      self.recipe_card.map do |recipe_card|
        recipe_card.recipe
      end
    end

    def add_recipe_card (recipe, date, rating)
      RecipeCard.new(self,recipe, date, rating)
    end

    def allergens
      Allergen.all.select do |allergen|
        allergen.user == self
      end
    end

    def declare_allergen(ingredient)
      Allergen.new(self, ingredient)
    end

    def top_three_recipes
      top_three_recipe_cards =self.recipe_card.sort_by {|recipe_card| recipe_card.rating}.reverse[0..2]
      top_three_recipe_cards.map do |recipe_cards|
        recipe_cards.recipe
      end
    end

    def most_recent_recipe
      most_recent_recipe_cards = self.recipe_card.sort_by {|recipe_card| recipe_card.date}.reverse[0..2]
      most_recent_recipe_cards.map do |recipe_cards|
        recipe_cards.recipe
      end
    end

end
