require "sqlite3"

class Database
  $db

  def find_products
    data = connect()
    manage_data(data)
    return data
  end

  def connect
    $db = SQLite3::Database.open "./db/myshopDB.db"
    puts "db: #{$db}"
    data = $db.execute "SELECT * FROM products"
    #puts data
    return data
  end

  def manage_data(data)
    puts data.class
  end
end
