require 'pry'


class Pokemon
  attr_accessor :name, :type, :db, :id, :hp

  @@all = []

  def initialize(name, hp = nil)
    @name = name
    @hp = hp
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO Pokemon (name, type) VALUES (?, ?)",name, type)
  end

  def self.find(id, db)
    a = db.execute("SELECT * FROM pokemon WHERE id=?", id)
    c = Pokemon.new(a[0][1])
    c.id = a[0][0]
    c.type = a[0][2]
    c.hp = a[0][3]
    c
  end
  def alter_hp(hp, db)
    db.execute("UPDATE POKEMON SET hp=? WHERE id =?", hp, self.id)
  end

end
