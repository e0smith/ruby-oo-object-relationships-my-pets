require "pry"

class Owner

  attr_accessor :pets, :cats
  attr_reader :name, :species

  @@pets = {:dogs => [], :cats => []}
  @@all = []
  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
  end

  def say_species
    "I am a human."
  end

  def self.all
    @@all
    # binding.pry
  end

  def self.count
    Owner.all.count
  end

  def self.reset_all
    @@all.clear()
  end

  def cats
    Cat.all.select {|c| c.owner == self}
  end

  def dogs
    Dog.all.select {|d| d.owner == self}
  end

  def buy_cat(name)
    Cat.new(name, self)
  end

  def buy_dog(name)
    Dog.new(name, self)
  end

  def walk_dogs
    Dog.all.each do |dog|
      dog.mood = "happy"
    end
    
    def feed_cats
      Cat.all.each do |cat|
        cat.mood = "happy"
      end
    end

    def pets
      @@pets
    end

    def sell_pets
      new_array = Dog.all.select {|dog| dog.owner == self} + Cat.all.select {|cat| cat.owner == self}
      new_array.each do |pet|
        pet.mood = "nervous"
        pet.owner = nil
      end
      new_array.clear
      # binding.pry
    end

    def list_pets
      "I have #{Dog.all.count {|dog| dog.owner == self}} dog(s), and #{Cat.all.count {|cat| cat.owner == self}} cat(s)."
    end
  end
end