require 'pry'

class Dog
  attr_accessor :name, :breed, :id

  def initialize (name:, breed:, id: nil)
    @id = id
    @name = name
    @breed = breed
  end

  def self.create_table
    sql = <<-SQL
      CREATE TABLE IF NOT EXISTS dogs
      (
        id INTEGER PRIMARY KEY,
        name TEXT,
        breed TEXT
      )
      SQL
      DB[:conn].execute(sql)
    end

    def self.drop_table
      sql = <<-SQL
        DROP TABLE dogs
        SQL

        DB[:conn].execute(sql)
    end

    def save
        sql = <<-SQL
        INSERT INTO dogs (name, breed)
        VALUES (?, ?)
        SQL

        DB[:conn].execute(sql, name, breed)
        @id = DB[:conn].execute("SELECT last_insert_rowid() FROM dogs")[0][0]
        self
    end

    def self.create(attributes)
      dog = Dog.new(attributes)
      dog.save
      dog
    end

    def self.new_from_db(row)
      id = row[0]
      name = row[1]
      breed = row[2]
      new_dog = self.new(name, breed, id)
      new_dog
      binding.pry
    end


end
