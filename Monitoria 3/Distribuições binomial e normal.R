###################################################################
#                                                                 #
#                 Curso de Ver�o - IME USP 2020                   #
#                                                                 #
#                Distribui��oes binomial e normal                 #
#                                                                 #
#  Autor: Rodrigo Matheus                                         # 
#  Instituto: IME USP                                             #
##################################################################

###################################################################
# Distribui��o binomial                                           #
##################################################################

# Fun��es e principais argumentos: 
?dbinom

# dbinom(x, size, prob) - Fun��o de probabilidade,
# pbinom(q, size, prob) - Fun��o de distribui��o acumulada,
# qbinom(p, size, prob) - Fun��o quant�lica (inversa da acumulada),
# rbinom(n, size, prob) - Gerador de n�meros aleat�rios que seguem a
#                         distribui��o binomial.

#   Veja na p�gina do 'help' das fun��es o que significam os argumentos 
# x, q, p e n, e tamb�m os argumentos size e prob.

###########################
### Quest�o 8 - Lista 2 ###
###########################
#   Na manufatura de certo artigo, � sabido que um entre dez dos
# artigos � defeituoso. Qual a probabilidade de que uma amostra
# casual de tamanho quatro contenha:
#
# a) nenhum defeituoso?
# b) exatamente um defeituoso?
# c) exatamente dois defeituosos?
# d) n�o mais do que dois defeituosos?

################################################
### Uma compara��o entre um modelo te�rico e ###
###     observa��es de uma  amostra          ###
################################################

#   Considere uma amostra de tamanho 100 simulada de uma
# distribui��o binomial proveniente de 10 ensaios e com
# probabilidade de sucesso igual a 0.63.
set.seed(1234)
x <- rbinom(100, 10, 0.63)
x

#     As propor��es observadas na amostra podem ser visualizadas num
# gr�fico de barras
obj <- barplot(prop.table(table(x)), col = "white")

#    Vamos comparar as quantidades observadas na amostra com quantidades
# te�ricas esperadas pelo modelo binomial

### Propor��es te�ricas versus observadas ###

#     As propor��es te�ricas (ou esperadas) do modelo binomial com 10
# ensaios de Bernoulli e probabilidade de sucesso 0.63 podem ser obtidas
# no no R com o seguinte comando
dbinom(0:10, 10, 0.63)

#     Para uma melhor visualiza��o, vamos comparar estas propor��es 
# esperadas com as propor��es observadas no gr�fico de barras
segments(obj, rep(0, length(obj)),
         obj, dbinom(sort(unique(x)), 10, 0.63),
         lwd = 3)

legend("topleft",
       legend = c("Propor��es te�ricas"),
       lwd = 3, lty = 1, bty = "n")

### Valor esperado e vari�ncia

# Valor esperado: 10*0.63 = 6.3
# Vari�ncia: 10*0.63*(1-0.63) = 2.33

# M�dia e vari�ncia observados
mean(x)
var(x)

#   Veja o que acontece se repetirmos os comandos acima pra um 
# tamanho amostral maior do que 100.

###################################################################
# Distribui��o normal                                            #
##################################################################

# Fun��es e principais argumentos: 
?dnorm

# dnorm(x, mean = 0, sd = 1) - Fun��o densidade,
# pnorm(q, mean = 0, sd = 1) - Fun��o de distribui��o acumulada,
# qnorm(p, mean = 0, sd = 1) - Fun��o quant�lica (inversa da acumulada),
# rnorm(n, mean = 0, sd = 1) - Gerador de n�meros aleat�rios que seguem a
#                         distribui��o normal.

###################################################################
# Quest�o 17                                                      #
##################################################################

# Quantis necess�rios para a classeifica��o
c1 <- qnorm(0.2, 5, 0.8)
c2 <- qnorm(0.75, 5, 0.8)
c3 <- qnorm(0.9, 5, 0.8)

########################################
# Curva normal com as �reas destacadas #
#######################################

# Fun��o curve
?curve

curve(dnorm(x, mean = 5, sd = 0.8),
      xlab = "Peso dos coelhos (kg)",
      ylab = "Densidade (modelo te�rico)",
      xlim = c(2,8))

# Fun��o polygon
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

# Fun��o legend
?legend

legend("topleft", legend = c("Pequenos", "M�dios", "Grandes", "Extras"),
       bty = "n", fill = c("gray50", "gray70", "gray90", "white"))

############################
### Quest�o 13 - Lista 2 ###
############################

#   Os dep�sitos efetuados no Banco da Ribeira durante o m�s de
# janeiro s�o distribu�dos normalmente, com m�dia de 10.000,00 e
# desvio padr�o de 1.500,00. Um dep�sito � selecionado ao acaso
# dentre todos os referentes ao m�s em quest�o. Enconte a
# probabilidade de que o dep�sito seja:

#  a) 10.000,00 ou menos;
#  b) pelo menos 10.000,00;
#  c) um valor entre 12.000,00 e 15.000,00;

