class Dog

  attr_accessor :mood
  attr_reader :name, :species

  def initialize(name)
    @name = name
    @mood = 'nervous'
    @species = 'dog'
  end
end
