class Actions
  require_relative "RomanDic"
  require_relative "Inventory"
  require_relative "Converter"
  require_relative "../res/Resources"

  def initialize
    @resources = Resources.new
    @converter = Converter.new
    @romanDic = RomanDic.new
    @inventory = Inventory.new
  end

  # => SYNTAX
  def galaxy(tokens)

    if tokens.include? "exit"
      puts "\n\t--    " + @resources.bye + "    --"
      return true

    elsif tokens.include? "how"
      if tokens.include? "much"
        # QUERY - how much ...
        index = tokens.find_index("much")

        if index + 2 >= tokens.size
          puts "Oh! I don't understand."
        else
          puts howMuch(tokens[index + 2..tokens.size])
        end
      elsif tokens.include? "many"
        # QUERY - how many ...
        index = tokens.find_index("many")
        item = tokens.last
        puts howMany(tokens[index + 2..tokens.size - 2], item)

      else
        puts "I have no idea what you are talking about. Check again!"
      end

    elsif tokens.include? "is"
      # QUERY - ... is ...
      index = tokens.find_index("is")
      if index == 0
        puts "Missing arguments"
      elsif index == 1
        # Set roman
        puts setRoman(tokens, index)
      else
        # Set inventory
        puts setInventory(tokens, index)
      end

    elsif tokens.include? "show"
      if tokens.include? "dictionary"
        puts "\nRoman to alien:\n"
        puts @romanDic.print
      elsif tokens.include? "inventory"
        puts "\nInventory:\n"
        puts @inventory.print
      else
        puts "\nSorry. I can't show that! I only have:\n" + @resources.showItens
      end

    elsif tokens.include? "help"
      puts @resources.helpTitle + "\n" + @resources.helpArgs + "\n" + @resources.helpSyntax

    else
      puts "I have no idea what you are talking about. Check again!"
    end

  end

  # => QUERYS
  def howMuch(tokens)
    number, roman = @converter.to_number(@romanDic, tokens)
    if number == -2
      return roman.to_s
    elsif number == -1
      return "Type again"
    else
      return roman.to_s + " = " + number.to_s
    end
  end
  def howMany(tokens, item)
    if @inventory.nil? || @inventory.empty?
      return "Inventory is empty!"
    elsif !@inventory.exit?(item)
      return "I don't know what item is."
    else
      number, roman = @converter.to_number(@romanDic, tokens)
      amount = @inventory.getAmount(item)
      amount = @converter.to_number(@romanDic, amount.split, false)
      moneyName = @inventory.getMoneyName(item)
      price = 0

      if number == -2
        return roman.to_s
      elsif number <= 0
        price = @inventory.getPrice(item)
        roman = "i"
      else
        price = @converter.price(@inventory.getPrice(item), amount, number)
      end
      return roman + " " + item.to_s + " is " + price.to_s + " " + moneyName.to_s
    end
  end

  # => SET
  def setRoman(tokens, index)
    if tokens.size == index + 1
      return "Missing arguments"
    end
    if @romanDic.include?(tokens[index - 1])
      # Roman is before IS
      key = tokens[index - 1]
      value = tokens[index + 1]
      return @romanDic.setDic(key, value)
    elsif @romanDic.include?(tokens[index + 1])
      # Roman is after IS
      key = tokens[index + 1]
      value = tokens[index - 1]
      return @romanDic.setDic(key, value)
    end
  end
  def setInventory(tokens, index)
    price = tokens[index..tokens.size].join.gsub(/[^0-9,.-]/, "").gsub(",", ".").to_i
    number, roman = @converter.to_number(@romanDic, tokens[0..index - 2])
    if number == -2
      return roman
    elsif number == -1
      return "Type again"
    elsif price == 0
      return "Missing price"
    end

    item = tokens[index - 1]
    amount = tokens[0..index - 2].join(" ")
    money = ""
    if tokens.size - (index + 1) > 1
      money = cleanString(tokens.last)
    end

    return @inventory.addItem(item, amount, price, money)
  end

  # => UTILS
  def tokenize(string, clean = true)
    if clean
      tokens = cleanString(string).split
      tokens = tokens.map{|s| s.gsub(/[^0-9A-Za-z-]/,"")}.reject{|s| s.empty?}
      return tokens
    else
      tokens = string.split
      return tokens
    end
  end
  def cleanString(string)
    return string.chomp.downcase
  end
end
