![Galaxy banner](art/Banner.png)

A program to help interstellar merchant fellows in convert roman numbers to alien numbers and both to numbers.

## Usage
#### Ruby
```shell
galaxy.rb [options] [input]
	--help ou -h:	Mostra mensagem de ajuda;
	--input ou -i:	Path para o input de arquivo;
	--exit ou -e:	Termina o programa no fim do arquivo se o arquivo é usado (digitar exit no fim do arquivo tem o mesmo efeito);
```
**Example:** `galaxy.rb -i test.txt`

## Design

- Galaxy.rb = Receive input from file and user.

- bin/
	- Actions.rb = Main core. Responsible to manage input and call other functions.
	- Converter.rb = Convert numbers, romans and alien words to other types and some math operations.
	- Inventory.rb = Manage inventory.
	- RomanDic.rb = Manage dictionary.

- res/
	- Resources.rb = Contains common strings.
