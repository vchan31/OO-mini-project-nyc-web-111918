class Allergen #joins User and  ingredients
  attr_accessor :user, :ingredient

  @@all = []

    def initialize(user, ingredient)

      @user = user
      @ingredient = ingredient

      @@all << self
    end

    def self.ingredients
      self.all.map do |allergen|
        allergen.ingredient
      end
    end

    def self.all
      @@all
    end
end
