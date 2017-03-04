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

- Galaxy.rb = Recebe input do arquivo e do usuário

- bin/
	- Actions.rb = A lógica príncipal, ele é responsavel de tratar o input e chamar a os métodos necessários
	- Converter.rb = Cuida de converter numeros, romanos e palavras para outros tipos e algumas operações matemáticas
	- Inventory.rb = Objeto que contem os metodos e váriaveis para armazenar itens
	- RomanDic.rb = Objeto que metodos e váriaveis para linkar palavras com os numeros romanos

- res/
	- Resources.rb = Contem strings e mensagens que podem ser alteradas sem mexer no codigo príncipal
