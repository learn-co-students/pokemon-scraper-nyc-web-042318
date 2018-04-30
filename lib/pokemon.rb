class Pokemon
  attr_accessor :name, :type, :db, :id

  def initialize(id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
  end

  def self.save(name, type, db)
    db.execute("INSERT into pokemon(name, type) VALUES(?, ?)", name, type)
  end

  def self.find(id, db)
    pokemon_id = db.execute("SELECT * FROM pokemon WHERE id = #{id}")

    new_id = pokemon_id[0][0]
    new_name = pokemon_id[0][1]
    new_type = pokemon_id[0][2]

    Pokemon.new(id: new_id, name: new_name, type: new_type, db: db)
  end
end
