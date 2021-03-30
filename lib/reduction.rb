class Reduction
  $cherryReduction = 0.20

  def self.instance
    @reduction ||= Reduction.new
  end

  def countbasket
    [
      $basket.count("Cerises"),
      $basket.count("Bananes"),
      $basket.count("Apples"),
      $basket.count("Mele")
    ]
  end

  def check_entry(entry, fruits)
    if entry.to_s == "Cerises"
      reduction = ($cherryReduction * 100)
      compute_discount(countbasket[0], 2, reduction)
    elsif entry.to_s == "Bananes"
      reduction = (fruits["Bananes"] * 100)
      compute_discount(countbasket[1], 2, reduction)
    else
      detect_language(entry.to_s, fruits)
    end
  end

  def detect_language(entry, fruits)
    if entry == "Apples"
      #reduction = (fruits["Apple"] * 100)
      reduction = fruits["Apples"]
      compute_discount(countbasket[2], 3, reduction)
    else
      reduction = (fruits["Mele"] * 100) - ((fruits["Mele"] * 100) / 2)
      compute_discount(countbasket[3], 2, reduction)
    end
  end

  def compute_discount(counter, modulo, reduction)
    (counter % modulo).zero? && counter != 0 ? reduction : 0
  end
end
