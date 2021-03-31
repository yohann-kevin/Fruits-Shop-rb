require "sqlite3"

class Database
  def find_products
    data = connect()
    manage_data(data)
    return data
  end

  def connect
    $db = SQLite3::Database.open "./db/myshopDB.db"
    puts "db: #{$db}"
    $db.execute "SELECT * FROM products"
  end

  def manage_data(data)
    puts data.class
  end
end
