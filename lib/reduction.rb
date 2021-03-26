class Reduction
  $cherryReduction = 0.20

  def count_basket
      return [
        $basket.count("cherry"),
        $basket.count("banana"),
        $basket.count("apple"),
        $basket.count("apfel")
      ]
  end

  def check_entry(entry, fruits)
    case entry.to_s
    when "cherry"
      reduction = compute_discount(count_basket[0], 2, ($cherryReduction * 100))
    when "banana"
      reduction = compute_discount(count_basket[1], 2, (fruits[:banana] * 100))
    when "apple"
      reduction = compute_discount(count_basket[2], 3, (fruits[:apple] * 100))
    when "apfel"
      reduction = compute_discount(count_basket[3], 2, (fruits[:apfel] * 100) - ((fruits[:apfel] * 100) / 2))
    else
      reduction = 0
    end
  end

  def compute_discount(counter, modulo, reduction)
    return reduction if counter % modulo == 0 && counter != 0
    return 0
  end
end