require 'pry'
# require_relative '../db/alter_table_migration.sql'
class Pokemon

  attr_accessor :name, :type, :db, :id, :hp


  def initialize(name)
    @name = name
  end


  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id, db)
    str ="SELECT * FROM pokemon WHERE id=?"
    response = db.execute(str, id)
    row_to_obj = self.response_to_obj(response)
    row_to_obj
  end

  def alter_hp(hp, db)
      db.execute("UPDATE pokemon SET hp=? WHERE id=? ",hp,self.id)
  end

  def self.response_to_obj(array)

    new_pokemon = Pokemon.new(array[0][1])
    new_pokemon.id = array[0][0]
    new_pokemon.type = array[0][2]
    new_pokemon.hp = array[0][3]
    new_pokemon
  end

end
