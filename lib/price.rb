class Price
  $sum = 0
  $basket = Array.new

  def initialize(reduction)
    @fruits = {
      "apple"=> 1, 
      "apfel"=> 1, 
      "pommes"=> 1,
      "banana"=> 1.50, 
      "cherry"=> 0.75
    }
    @reduction = reduction
  end

  def getPrice(arg)
    allArticle = arg.split(", ")
    if allArticle.length == 1
      entry = arg.to_s
      computeCents(@fruits[entry],entry) if testValue(entry)
    else
      allArticle.each do |el|
        getPrice(el)
      end
    end
    return $sum.to_i
  end
    
  def testValue(entry)
    @fruits.each do | key, value |
      if entry == key
        $basket << entry.to_s
        return true
      else
        puts key
      end
    end
    return false
  end
    
  def computeCents(fruits, entry)
    result = fruits * 100
    result -= @reduction.check_entry(entry,@fruits)
    puts "#{result} centime"
    $sum += result
    puts "vous devez payer #{$sum} centime"
  end
end