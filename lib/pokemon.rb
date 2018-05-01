require 'pry'

class Pokemon

  attr_accessor :name, :type, :db, :id

  @@all = []

  def initialize(name)
    @name = name
    @type = type
    @db = db
    @@all << self
    @id = id
  end


  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id, db)
    str ="SELECT * FROM pokemon WHERE id=?"
    response = db.execute(str, id)
    self.response_to_obj(response)
  end

  def self.response_to_obj(array)
    new_pokemon = Pokemon.new(array[0][1])
    new_pokemon.id = array[0][0]
    new_pokemon.type = array[0][2]
    new_pokemon
  end


end
