class Pokemon

  attr_accessor :name, :type, :db, :id, :hp
  @@all = []

  def initialize(name)
    @name = name
    # @type = type
    # @db = db
  end

  def alter_hp(hp, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", hp, self.id)
  end

  def self.save(name, type, db)
    a = db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
    a
  end

  def self.find(id, db)
    sql = "SELECT * FROM pokemon WHERE id=(?)"
    poke_array_of_arrays = db.execute(sql, id)
    self.converter(poke_array_of_arrays)
  end

  def self.converter(array)
    pokemon_array = array[0]
    pokemon = Pokemon.new(pokemon_array[1])
    pokemon.type = pokemon_array[2]
    pokemon.id = pokemon_array[0]
    pokemon.hp = pokemon_array[3]
    pokemon
  end



end
