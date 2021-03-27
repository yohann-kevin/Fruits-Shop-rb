class Reduction
  $cherryReduction = 0.20

  def count_basket
    [
      $basket.count("cherry"),
      $basket.count("banana"),
      $basket.count("apple"),
      $basket.count("apfel")
    ]
  end

  def check_entry(entry, fruits)
    if entry.to_s == "cherry"
      compute_discount(count_basket[0], 2, ($cherryReduction * 100))
    elsif entry.to_s == "banana"
      compute_discount(count_basket[1], 2, (fruits["banana"] * 100))
    else
      detect_language(entry.to_s, fruits)
    end
  end

  def detect_language(entry, fruits)
    if entry == "apple"
      compute_discount(count_basket[2], 3, (fruits["apple"] * 100))
    else
      compute_discount(count_basket[3], 2, (fruits["apfel"] * 100) - ((fruits["apfel"] * 100) / 2))
    end
  end

  def compute_discount(counter, modulo, reduction)
    (counter % modulo).zero? && counter != 0 ? reduction : 0
  end
end
