class Reduction
  $cherryReduction = 0.20

  def countBasket
    basketCount = [
      $basket.count("cherry"),
      $basket.count("banana"),
      $basket.count("apple"),
      $basket.count("apfel")
    ]
  end

  def checkEntry(entry,fruits)
    case entry.to_s
    when "cherry"
      return computeDiscount(countBasket[0],2,($cherryReduction * 100))
    when "banana"
      return computeDiscount(countBasket[1],2,(fruits[:banana] * 100))
    when "apple"
      return computeDiscount(countBasket[2],3,(fruits[:apple] * 100))
    when "apfel"
      return computeDiscount(countBasket[3],2,(fruits[:apfel] * 100) - ((fruits[:apfel] * 100) / 2))
    else
      reduction = 0
    end
  end

  def computeDiscount(counter, modulo,reduction)
    return reduction if counter % modulo == 0 && counter != 0
    return 0
  end
end