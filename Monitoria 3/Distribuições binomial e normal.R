###################################################################
#                                                                 #
#                 Curso de Verão - IME USP 2020                   #
#                                                                 #
#                Distribuiççoes binomial e normal                 #
#                                                                 #
#  Autor: Rodrigo Matheus                                         # 
#  Instituto: IME USP                                             #
##################################################################

###################################################################
# Distribuição binomial                                           #
##################################################################

# Funções e principais argumentos: 
?dbinom

# dbinom(x, size, prob) - Função de probabilidade,
# pbinom(q, size, prob) - Função de distribuição acumulada,
# qbinom(p, size, prob) - Função quantílica (inversa da acumulada),
# rbinom(n, size, prob) - Gerador de números aleatórios que seguem a
#                         distribuição binomial.

#   Veja na página do 'help' das funções o que significam os argumentos 
# x, q, p e n, e também os argumentos size e prob.

###########################
### Questão 8 - Lista 2 ###
###########################
#   Na manufatura de certo artigo, é sabido que um entre dez dos
# artigos é defeituoso. Qual a probabilidade de que uma amostra
# casual de tamanho quatro contenha:
#
# a) nenhum defeituoso?
# b) exatamente um defeituoso?
# c) exatamente dois defeituosos?
# d) não mais do que dois defeituosos?

################################################
### Uma comparação entre um modelo teórico e ###
###     observações de uma  amostra          ###
################################################

#   Considere uma amostra de tamanho 100 simulada de uma
# distribuição binomial proveniente de 10 ensaios e com
# probabilidade de sucesso igual a 0.63.
set.seed(1234)
x <- rbinom(100, 10, 0.63)
x

#     As proporções observadas na amostra podem ser visualizadas num
# gráfico de barras
obj <- barplot(prop.table(table(x)), col = "white")

#    Vamos comparar as quantidades observadas na amostra com quantidades
# teóricas esperadas pelo modelo binomial

### Proporções teóricas versus observadas ###

#     As proporções teóricas (ou esperadas) do modelo binomial com 10
# ensaios de Bernoulli e probabilidade de sucesso 0.63 podem ser obtidas
# no no R com o seguinte comando
dbinom(0:10, 10, 0.63)

#     Para uma melhor visualização, vamos comparar estas proporções 
# esperadas com as proporções observadas no gráfico de barras
segments(obj, rep(0, length(obj)),
         obj, dbinom(sort(unique(x)), 10, 0.63),
         lwd = 3)

legend("topleft",
       legend = c("Proporções teóricas"),
       lwd = 3, lty = 1, bty = "n")

### Valor esperado e variância

# Valor esperado: 10*0.63 = 6.3
# Variância: 10*0.63*(1-0.63) = 2.33

# Média e variância observados
mean(x)
var(x)

#   Veja o que acontece se repetirmos os comandos acima pra um 
# tamanho amostral maior do que 100.

###################################################################
# Distribuição normal                                            #
##################################################################

# Funções e principais argumentos: 
?dnorm

# dnorm(x, mean = 0, sd = 1) - Função densidade,
# pnorm(q, mean = 0, sd = 1) - Função de distribuição acumulada,
# qnorm(p, mean = 0, sd = 1) - Função quantílica (inversa da acumulada),
# rnorm(n, mean = 0, sd = 1) - Gerador de números aleatórios que seguem a
#                         distribuição normal.

###################################################################
# Questão 17                                                      #
##################################################################

# Quantis necessários para a classeificação
c1 <- qnorm(0.2, 5, 0.8)
c2 <- qnorm(0.75, 5, 0.8)
c3 <- qnorm(0.9, 5, 0.8)

########################################
# Curva normal com as áreas destacadas #
#######################################

# Função curve
?curve

curve(dnorm(x, mean = 5, sd = 0.8),
      xlab = "Peso dos coelhos (kg)",
      ylab = "Densidade (modelo teórico)",
      xlim = c(2,8))

# Função polygon
?polygon

polygon(x = c(2, c1, seq(c1, 2, -0.001)),
        y = c(0, 0, dnorm(seq(c1, 2, -0.001), mean = 5, sd = 0.8)),
        border = NA,
        col = "gray50")

polygon(x = c(c1, c2, seq(c2, c1, -0.001)),
        y = c(0, 0, dnorm(seq(c2, c1, -0.001), mean = 5, sd = 0.8)),
        border = NA,
        col = "gray70")

polygon(x = c(c2, c3, seq(c3, c2, -0.001)),
        y = c(0, 0, dnorm(seq(c3, c2, -0.001), mean = 5, sd = 0.8)),
        border = NA,
        col = "gray90")

# Função legend
?legend

legend("topleft", legend = c("Pequenos", "Médios", "Grandes", "Extras"),
       bty = "n", fill = c("gray50", "gray70", "gray90", "white"))

############################
### Questão 13 - Lista 2 ###
############################

#   Os depósitos efetuados no Banco da Ribeira durante o mês de
# janeiro são distribuídos normalmente, com média de 10.000,00 e
# desvio padrão de 1.500,00. Um depósito é selecionado ao acaso
# dentre todos os referentes ao mês em questão. Enconte a
# probabilidade de que o depósito seja:

#  a) 10.000,00 ou menos;
#  b) pelo menos 10.000,00;
#  c) um valor entre 12.000,00 e 15.000,00;

