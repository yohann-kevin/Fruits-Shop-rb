class Reduction
  $cherryReduction = 0.20

  def self.instance
    @reduction ||= Reduction.new  
  end

  def countbasket
    [
      $basket.count("cherry"),
      $basket.count("banana"),
      $basket.count("apple"),
      $basket.count("apfel")
    ]
  end

  def check_entry(entry, fruits)
    if entry.to_s == "cherry"
      reduction = ($cherryReduction * 100)
      compute_discount(countbasket[0], 2, reduction)
    elsif entry.to_s == "banana"
      reduction = (fruits["banana"] * 100)
      compute_discount(countbasket[1], 2, reduction)
    else
      detect_language(entry.to_s, fruits)
    end
  end

  def detect_language(entry, fruits)
    if entry == "apple"
      reduction = (fruits["apple"] * 100)
      compute_discount(countbasket[2], 3, reduction)
    else
      reduction = (fruits["apfel"] * 100) - ((fruits["apfel"] * 100) / 2)
      compute_discount(countbasket[3], 2, reduction)
    end
  end

  def compute_discount(counter, modulo, reduction)
    (counter % modulo).zero? && counter != 0 ? reduction : 0
  end
end
