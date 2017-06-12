class Owner

  @@all = []
  attr_accessor :pets, :name
  attr_reader :species

  def initialize(name)
    @pets = {fishes: [], dogs: [], cats: []}
    @name = name
    @species = 'human'
    self.all << self
  end

  def all
    @@all
  end

  def self.all
    @@all
  end

  def self.reset_all
    self.all.map! do |element|
      nil
    end.compact!
  end

  def self.count
    self.all.size
  end

  def say_species
    'I am a ' + @species + '.'
  end

  def buy_fish(fish_name)
    fishy = Fish.new(fish_name)
    @pets[:fishes] << fishy
    fishy
  end

  def buy_cat(cat_name)
    kitty = Cat.new(cat_name)
    @pets[:cats] << kitty
    kitty
  end

  def buy_dog(dog_name)
    doggo = Dog.new(dog_name)
    @pets[:dogs] << doggo
    doggo
  end

  def walk_dogs
    @pets[:dogs].each do |dog|
      dog.mood = 'happy'
    end
  end

  def play_with_cats
    @pets[:cats].each do |cat|
      cat.mood = 'happy'
    end
  end

  def feed_fish
    @pets[:fishes].each do |fish|
      fish.mood = 'happy'
    end
  end

  def sell_pets
    @pets.map do |species, pets|
      pets.map! do |pet|
        pet.mood = 'nervous'
        nil
      end.compact!
    end
  end

  def list_pets
    return_string = "I have"
    @pets.each do |species, pets|
      species = ''
      pets.each do |pet|
        species = pet.species
      end
      if species == 'fish'
        return_string << " #{pets.size} #{species},"
      elsif species == 'cat'
        return_string << " and #{pets.size} #{species}(s)."
      else
        return_string << " #{pets.size} #{species}(s),"
      end
    end
    return_string
  end
end
