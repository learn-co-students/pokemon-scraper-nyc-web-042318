require 'pry'
class Pokemon
  attr_accessor :name, :type, :db, :id, :hp

  def initialize (id:, name:, type:,db:, hp: nil)
    @id = id
    @name = name
    @type = type
    @db = db

    @hp = hp

  end

  def self.save(aname, atype, db)

    db.execute("INSERT INTO pokemon(name,type) VALUES (?,?)",aname, atype)
  end


  def self.find(id,db)
    k = db.execute("select * from pokemon where id = ?",id)
    # binding.pry
    self.new(id:k[0][0],name:k[0][1],type:k[0][2],db:db, hp:60) if !k.empty?
  end

end
