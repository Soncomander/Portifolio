class Inventory
  def initialize()
    @inventory = {}
  end

  def addItem(name, amount, price, moneyName = "")
    if moneyName.nil? || moneyName.empty?
      @inventory[name] = [amount, price, "Credits"]
      return "Item added!"
    else
      @inventory[name] = [amount, price, moneyName]
      return "Item added!"
    end
  end

  def getItem(id)
    if id.nil? || blank?
      return nil
    else
      return @inventory[id]
    end
  end
  def getAmount(id)
    if id.nil? || blank?
      return nil
    else
      return @inventory[id][0].to_s
    end
  end
  def getPrice(id)
    if id.nil? || blank?
      return nil
    else
      return @inventory[id][1].to_i
    end
  end
  def getMoneyName(id)
    if id.nil? || blank?
      return nil
    else
      return @inventory[id][2].to_s
    end
  end

  def empty?
    @inventory.empty?
  end
  def blank?
    if @inventory.nil? || @inventory.empty?
      return true
    else
      return false
    end
  end
  def exit?(key)
    return @inventory.has_key? key
  end
  def print
    if @inventory.empty?
      return " - Empty!"
    else
      return @inventory.map { |k,v| " - #{v[0].capitalize} #{k.capitalize} = #{v[1]} #{v[2].capitalize}"  }.sort
    end
  end
end
