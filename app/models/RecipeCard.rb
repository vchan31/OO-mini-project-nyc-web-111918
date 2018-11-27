class RecipeCard # joins User and recipe

  attr_reader :user, :recipe, :date, :rating

  @@all = []

    def initialize(user, recipe, rating = 2, date = Time.new)

      @user = user
      @recipe = recipe
      @date = date
      @rating = rating

      @@all << self
    end

    def self.all
      @@all
    end
end
