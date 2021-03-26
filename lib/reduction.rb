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
    case entry.to_s
    when "cherry"
      compute_discount(count_basket[0], 2, ($cherryReduction * 100))
    when "banana"
      compute_discount(count_basket[1], 2, (fruits["banana"] * 100))
    when "apple"
      compute_discount(count_basket[2], 3, (fruits["apple"] * 100))
    when "apfel"
      compute_discount(count_basket[3], 2, (fruits["apfel"] * 100) - ((fruits["apfel"] * 100) / 2))
    else
      0
    end
  end

  def compute_discount(counter, modulo, reduction)
    (counter % modulo).zero? && counter != 0 ? reduction : 0
  end
end
