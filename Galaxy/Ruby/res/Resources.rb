class Resources
  def initialize()
    @byeDic = ["May the force be with you",
               "Goodbye",
               "Hasta la vista, baby.",
               "In case I don't see you - good afternoon, good evening, and goodnight!"]

    @showItens = "\n\tInventory;" +
                 "\n\tDictionary;"

    @helpTitle = "\n\t\t      ___       __  " +
                 "\n\t\t|__| |__  |    |__) " +
                 "\n\t\t|  | |___ |___ |    "


    @helpSyntax = "" +
                "\nHow to link word with roman letter?" +
                "\nSimple! Type a word than 'is' and the letter! Example:"+
                "\n\tCar is I" +
                "\n" +
                "\nHow to see values?" +
                "\nSimple too, just make the question with 'how much is...'. Example:" +
                "\n\tHow much is Car Car Car? => III" +
                "\n\tHow much is III? => Car Car Car" +
                "\n" +
                "\nHow check what is linked and my itens?" +
                "\nJust type 'show' and what you wanna see. Example:" +
                "\n\tShow inventory. => Display your itens" +
                "\n\tShow dictionary. => Display your linked words" +
                "\n"

    @helpArgs = "" +
              "\n\t--help or -h:\tShow this help" +
              "\n\t--input or -i:\tSet input file" +
              "\n\t--exit or -e:\tExit when input file end (if using input file)"+
              "\n"

    @description = "A program to help any interstellar merchant fellow, using roman letters and the local language."
    @creator = "Samuel Mendes"
  end

  def bye
    return @byeDic[rand(0...@byeDic.count)]
  end

  def showItens
    return @showItens
  end

  def helpTitle
    return @helpTitle
  end

  def helpSyntax
    return @helpSyntax
  end

  def helpArgs
    return @helpArgs
  end

  def description
    return @description
  end

  def creator
    return @creator
  end
end
