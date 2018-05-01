class Pokemon

  attr_accessor :name, :type, :db, :id
  @@all = []

  def initialize(name)
    @name = name
    # @type = type
    # @db = db
  end



  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id, db)
    sql = "SELECT * FROM pokemon WHERE id=(?)"
    poke_array_of_arrays = db.execute(sql, id)
    pokemon = Pokemon.new(poke_array_of_arrays[0][1])
    pokemon.type = poke_array_of_arrays[0][2]
    pokemon.id = poke_array_of_arrays[0][0]
    pokemon
  end

  # def self.converter(array)
  #   pokemon_array = poke_array_of_arrays[0]
  #   pokemon = Pokemon.new(pokemon_array[1])
  #   pokemon.type = pokemon_array[2]
  #   pokemon.id = pokemon_array[0]
  #   pokemon
  # end



end
