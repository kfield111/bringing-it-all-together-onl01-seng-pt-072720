class Dog
  attr_accessor :name, :breed, :id, :db

  def initialize (name, breed, id = nil, db)
    @id = id
    @name = name
    @breed = breed
  end



end
