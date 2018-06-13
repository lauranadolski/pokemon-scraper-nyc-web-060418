require 'pry'

class Pokemon

attr_accessor :name, :type, :db, :id

  def initialize(name:, type:, db:, id:)
    @name = name
    @type =  type
    @db =  db
    @id = id
  end

  def self.save(name, type, db)
    sql_string = <<-SQL_STRING
      INSERT INTO pokemon (name, type)
      VALUES (?, ?);
    SQL_STRING

    db.execute(sql_string, name, type)
  end

  def self.find(id, db)
    sql_string = <<-SQL_STRING
      select *
      from pokemon
      where id = ?
    SQL_STRING

    helper_array = db.execute(sql_string, id)

    self.new(id: helper_array[0][0], name: helper_array[0][1], type: helper_array[0][2], db: @db)

  end




end
