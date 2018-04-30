require 'pry'

class Pokemon
  attr_accessor :id, :name, :type, :db, :hp

  @@all =[]

  def initialize(id:, name:, type:, db:, hp: nil)
    @id = id
    @name = name
    @type = type
    @hp = hp
    @db = db
    @@all << self
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon(name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id, db)
    found_pokemon = db.execute("SELECT * FROM pokemon WHERE id = (?)", id)
    Pokemon.new(id: found_pokemon[0][0], name: found_pokemon[0][1], type: found_pokemon[0][2], hp: found_pokemon[0][3], db: db)
  end

  def alter_hp(num, db)
    db.execute("UPDATE pokemon SET hp = #{num} WHERE id = #{self.id}")
  end
end
