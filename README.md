# :computer: Compilador GFS :mechanical_arm:
Este projeto consiste na implementação integral de um compilador GFS. Realizou-se o projeto no segundo semestre de 2022 como parte da avaliação da disciplina “Compiladores” do curso de Engenharia de Computação da Universidade Federal de Itajubá (UNIFEI - _campus_ Itajubá).

## Como executar?
### Passo 0
Antes de tudo, é necessário realizar a instalação de algumas ferramentas:
1. [GNU](https://gcc.gnu.org/) (Compilador C/C++)
2. [Flex](https://www.gnu.org/software/flex/) (Analisador léxico)
3. [Bison](https://www.gnu.org/software/bison/) (Analisador sintático)

### Passo 1
Após as instalações, faça o download dos arquivos `gfs.l` `gfs.y` `main.gfs` e certifique-se de que estão em um diretório comum para a execução do projeto.

### Passo 2
Abra o Prompt de Comando do Windows, acesse o diretório em que os arquivos estão localizados, como por exemplo pelo comando `cd C:\Users\guilh\OneDrive\Desktop\GFS` e insira os seguintes comandos:
`bison -d gfs.y`
`flex gfs.l`
O primeiro comando executa o Analisador Léxico e o segundo comando executa o Analisador Sintático. Com os dois comandos executados, surgirão três arquivos no diretório de trabalho: `gfs.tab.h` `gfs.tab.c` `lex.yy.c`.

### Passo 3
Em seguida, insira o seguinte comando: `g++ lex.yy.c gfs.tab.c -o gfs.exe`. O arquivo executável gerado é o compilador.

### Passo 4
Agora, execute o compilador passando o arquivo do programa criado com a linguagem GFS como parâmetro. Segue o código de exemplo:
```
inicio
	inteiro i1 = 0;
	enquanto(i1 <= 5)
	{
		mostre(i1) pula;
		i1 = i1 + 1; 
	}
fim
```
Comando: `gfs.exe main.gfs`

### Passo 5
O passo anterior produzirá dois arquivos `file1.txt` (código traduzido para a linguagem `C++`) e `file2.txt` (reconhecimento dos tokens). Abra o arquivo gerado `file1.txt`, copie o seu texto e crie um arquivo `.cpp` contendo o texto copiado.

### Passo 6
No Prompt de Comando, insira o seguinte comando para compilar o programa `.cpp`: `g++ main.cpp -o main.exe`.

### Passo 7
Por fim, execute o arquivo `main.exe` gerado pelo próprio Terminal e verifique a sua execução. :man_technologist:
