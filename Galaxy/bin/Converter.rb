class Converter
  def initialize

  end

  def to_number(romanDic, tokens, returnRoman = true)
    isRoman = false
    roman = to_roman(romanDic, tokens)
    number = romanToNumber(roman)
    if number <= 0
      isRoman = true
      number = romanToNumber(tokens.join)
      if number == -1
        number = -2
      else
        roman = numberToRoman(number)
      end
    end
    roman = tokens.join(" ") if !isRoman
    if returnRoman
      return number, roman
    else
      return number
    end
  end

  def to_roman(romanDic, text)
    if romanDic.nil? || text.nil?
      return ""
    end

    romanized = ""

    text.each{
      |s| roman = romanDic.findKey(s)
      if !roman.nil?
        romanized.insert(-1, roman)
      end
    }
    return romanized
  end

  def numberToRoman(value)
    if value >= 4000
      return "Over limit! Romans can't handle this!"
    end

    valueSplited = value.to_s.chars.map(&:to_i)
    totalDigits = valueSplited.size
    romanized = ""
    nextRoman = ""
    actualRoman = ""
    previousRoman = ""

    valueSplited.each{
      |n|

      case totalDigits
      when 4
        nextRoman = ""
        actualRoman = "m"
        previousRoman = "d"
      when 3
        nextRoman = "m"
        actualRoman = "d"
        previousRoman = "c"
      when 2
        nextRoman = "c"
        actualRoman = "l"
        previousRoman = "x"
      when 1
        nextRoman = "x"
        actualRoman = "v"
        previousRoman = "i"
      end

      if n <= 3
        for i in 1..n
          if totalDigits == 4
            romanized += actualRoman
          else
            romanized += previousRoman
          end
        end
      elsif n == 4
        romanized += previousRoman + actualRoman
      elsif n <= 8
        romanized += actualRoman
        for i in 6..n
          romanized += previousRoman
        end
      elsif n == 9
        romanized += previousRoman + nextRoman
      elsif n == 10
        romanized += nextRoman
      end
      totalDigits -= 1
    }
    return romanized
  end

  def romanToNumber(text, debug = false)
    if text.nil? || text.empty?
      return -1
    end
    romanLetters = ['m','d','c','l','x','v','i']
    value = 0
    one = 1000
    five = 500
    for i in 0..6
      even = (i % 2) == 0 ? true : false
      letter = ""
      mod = 0
      if even
        letter = romanLetters[i + 2]
        mod = one
        one /= 10
      else
        letter = romanLetters[i + 1]
        mod = five
        five /= 10
      end
      amount = text.count(romanLetters[i])
      (1..amount).each do
        previousRoman = text.index(romanLetters[i]).to_i - 1
        if text[previousRoman] == letter and previousRoman >= 0
          decrease = true
        else
          decrease = false
        end
        puts romanLetters[i].to_s + " => " + amount.to_s if debug
          if decrease
            if even
              value += mod - (one)
            else
              value += mod - one
            end
            #text.slice!(letter + romanLetters[i])
            text = text.sub(letter + romanLetters[i], '')
            decrease = false
          else
            value += mod
            text = text.sub(romanLetters[i], '')
            #text.slice!(romanLetters[i])
          end
      end
    end

    if value >= 4000
      puts "Over limit! Romans can't handle this!"
      return value
    else
      return value
    end
  end

  def price(price, amount, x)
    return (price * x) / amount
  end
end
