class Dog
  attr_accessor :name, :breed, :id, :db

  def initialize (id:, name:, breed:, db:)
    @id = id
    @name = name
    @breed = breed
    @db = db
  end



end
