class RomanDic
  # Constructor
  def initialize()
      @dic = Hash["i" => "",
                  "v" => "",
                  "x" => "",
                  "l" => "",
                  "c" => "",
                  "d" => "",
                  "m" => ""]
  end

  def getDic
    return @dic
  end

  def include?(roman)
    return @dic.include? roman
  end

  def setDic(roman, word)
    if !findKey(word)
      @dic[roman] = word
      return roman.capitalize + " have been set."
    else
      return word.capitalize + " is already linked with " + findKey(word).capitalize
    end
  end

  def findKey(search)
    return @dic.key(search)
  end
  def getKeys()
    return @dic.keys
  end

  def print
    return @dic.map { |k,v| " - #{k.capitalize} = #{v}\n" }
  end
end
