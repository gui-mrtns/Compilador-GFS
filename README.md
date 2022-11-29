# Compilador GFS

### Passo 1

Baixar os arquivos `gfs.l` e `gfs.y` e movê-los para o mesmo diretório.

### Passo 2

Abra o Prompt de Comando do Windows, acesse o diretório que contém os arquivos baixados e insira os seguintes comandos:
1. `bison -d gfs.y`
2. `flex gfs.l`

### Passo 3

Em seguida, insira o seguinte comando...
`g++ lex.yy.c gfs.tab.c -o gfs.exe`

### Passo 4

Agora, crie o seu programa utilizando a linguagem GFS e salve-o com o nome que preferir e com a extensão `.gfs`. Segue um código exemplo:
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

### Passo 5

No Prompt de Comando insira o comando `gfs.exe main.gfs`.

### Passo 6

Abra o arquivo gerado `file1`, copie o seu texto e crie um arquivo `.cpp` contendo o texto copiado.


### Passo 7

Insira o seguinte comando no Terminal: `g++ main.cpp -o main`

### Passo 8

Por fim, execute o arquivo `.exe` gerado.
