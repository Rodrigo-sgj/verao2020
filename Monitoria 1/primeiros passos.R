###################################################################
#                                                                 #
#                 Curso de Verão - IME USP 2020                   #
#                                                                 #
#                      Primeiros passos no R                      #
#                                                                 #
#  Autor: Rodrigo Matheus                                         # 
#  Instituto: IME USP                                             #
##################################################################

# Principal referência
# http://material.curso-r.com/rbase/

# Sumário
# - R como calculadora
# - Objetos
#     - Atribuição
#     - Vizualização dos objetos
#     - Tipos básicos de objetos no R 
#     - Vetores 
#     - Matrizes
#     - Fatores 
#     - Valores especiais 
#     - Data frames

###########################
# R como calculadora      #
##########################
2 + 3   # adição
14 - 23 # subtração
7 * 8   # multiplicação
5 / 3   # divisão
2 ^ 5   # potência
3 %% 2  # resto da divisão de 3 por 2
3i * 2i # operação com números complexos

#   As operações e suas precedências são mantidas como na matemática,
# ou seja, divisão e multiplicação são calculadas antes da adição e
# subtração. 
3 + 4 * 2 
5 * 2 - 1,5 / 3 # Erro na sintaxe do '1,5', o correto é '1.5'
5 * 2 - 1.5 / 3
5 + (- 1)
(2 + 6) * (5 + 4)

#   Comandos incompletos serão destacados com o símbolo '+'. Não 
# confundir com o operador de adição.
5 -
  
###########################
# Objetos                 #
##########################

### Atribuição ###
x <- 2  
y <- 3
7 -> z

# OBS: Também podemos utilizar o sinal '=', ao invés de '<-' para
# atribuições.

# OBS: O R diferencia letras maiúsculas e minúsculas. 

### Visualização dos objetos ###
x
print(x)
print(paste(x, y, z))

### Tipos básicos de objetos no R ###

# - character
"joão"
"maria"
"234"

# - numeric
1
0.10
pi

# - integer
1L
5L
10L

# - complex
2 + 5i

# - logical
TRUE
FALSE

# Para saber a classe de um objeto, utiliza-se a função 'class'
x <- "maria"
class(x)

### Vetores ###
vetor1 <- c(1, 2, 3, 4)
vetor2 <- c("a", "b", "c", "d")

vetor1
vetor2

# O vetor sempre possui a classe dos elementos que carrega
class(vetor1)
class(vetor2)

#    Se adicionarmos a um vetor elementos com diferentes classes, este
# só poderá ter uma classe. A ordem de precedência das classes são
# character > complex > numeric > integer > logical
vetor3 <- c("a", 1, 2.3, 2L, TRUE)
class(vetor3)
vetor4 <- c(1, 2.3, 2L, TRUE)
class(vetor4)

### Operações com vetores ###
vetor1 - 1
vetor1 / 2
vetor1 * 10
vetor1 * vetor1

# OBS: Tome cuidado com expressões com vetores de tamanhos diferentes.
vetor5 <- 1:3
vetor1 * vetor5

### Matrizes ###
m1 <- matrix(1:6, nrow = 2)
m1

#    Os números de 1 a 6 foram dispostos por coluna da esquerda para a 
# direita. Para adicionar os números por coluna, basta escrever a opção
# 'byrow = TRUE' nos argumentos da função 'matrix'.
m2 <- matrix(1:6, nrow = 2, byrow = TRUE)
m2

#   Algumas operações úteis com matizes são dadas a seguir.
m3 <- matrix(1:6, ncol = 2)

m1[2,  ]   # seleciona a segunda linha
m1[ , 1]   # seleciona a primeira coluna
m1[1, 2]   # seleciona o primeiro elemento da segunda coluna
t(m1)      # matriz transposta
m1 %*% m3  # multiplicação matricial

m4 <- matrix(1:4, nrow = 2)
solve(m4)  # matriz inversa de m4

### Fatores ###

# Os fatores podem ser vistos como um vetor de inteiros com rótulos
sexo <- c("M", "H", "H", "H", "M", "M", "H")
fator <- as.factor(sexo)
fator

# A função 'levels()' retorna os rótulos do fator
levels(fator)

#    A ordem dos níveis dos fatores pode importar, por exemplo na ordem
# de apresentação em gráficos de barras. Por padrão, o R coloca os 
# níveis em ordem alfabética.

### Valores especiais ###

# NA (Not Available)

#    Significa dado faltante/indisponível. O NA tem uma classe, ou
# seja, podemos ter NA numeric, NA character etc.

# NaN (Not a Number)

#   Representa indefinições matemáticas, como 0/0 e log(-1). Um NaN é
# um NA, mas a recíproca não é verdadeira.

# Inf (Infinito)

#    É um número muito grande ou o limite matemático, por exemplo, 1/0
# e 10^310. Aceita sinal negativo -Inf.

# NULL

#   Representa a ausência de informação. Conceitualmente, a diferença
# entre NA e NULL é sutil, mas, no R, o NA está mais alinhado com os
# conceitos de estatística (ou como gostaríamos que os dados faltantes
# se comportassem em análise de dados) e o NULL está em sintonia com
# comportamentos de lógica de programação.

### Data frames ###

#   Os data.frame's são listas em que todos os elementos possuem o
# mesmo comprimento. Cada elemento dessa lista pode ser pensado como
# uma coluna da tabela. Seu comprimento representa o número de linhas.
dados <- data.frame(individuo = c("a", "b", "c"),
                    idade = c(23, 34, 47),
                    sexo = as.factor(c("H", "F", "F")),
                    renda = c(2300, 1250, 10246))

dados
