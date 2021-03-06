###################################################################
#                                                                 #
#                 Curso de Ver�o - IME USP 2020                   #
#                                                                 #
#             An�lise do conjunto de dados 'mtcars'               #
#                                                                 #
#  Autor: Rodrigo Matheus                                         # 
#  Instituto: IME USP                                             #
##################################################################

###################################################################
# 1 Leitura e formata��o                                          #
##################################################################

# Leitura
data("mtcars")

# Visualiza��o inicial 
head(mtcars)

# Descri��o
?mtcars

# Formata��o
mtcars$vs <- factor(mtcars$vs, labels = c("forma de v", "em linha"))
mtcars$am <- factor(mtcars$am, labels = c("automatico", "manual"))

# OBS: Exclus�o das vari�veis 'disp', 'drat', 'qsec', 'gear' e carb'
mtcars <- mtcars[, -c(3, 5, 7, 10, 11)]

head(mtcars)

# Estrutura do banco de dados
str(mtcars)

# Vari�vel resposta: 'mpg'
# Vari�veis quantitativas: 'mpg', 'cyl', 'hp' e 'wt'
# Vari�veis qualitativas: 'vs' e 'am' (ambas em escala nominal)

# Disponibiliza��o
attach(mtcars)

###################################################################
# 2 An�lise explorat�ria                                          #
##################################################################

# Guardando os nomes dos carros em um objeto
nomes <- rownames(mtcars)
nomes

# Resumo inicial
summary(mtcars)

# Desvio padr�o
sd(mpg)
sd(cyl)
sd(hp)
sd(wt)

##############################
### An�lise unidimensional ###
##############################

# Histograma e boxplot da vari�vel 'mpg'
hist(mpg, xlab = "Performance (milhas/gal�o)", ylab = "Frequ�ncia",
     col = "lightblue", main = " ")

boxplot(mpg, ylab = "Performance (milhas/gal�o)")

# Gr�fico de barras da vari�vel 'cyl'
barplot(table(cyl), xlab = "N�mero de cilindros", ylab = "Frequ�ncia",
     col = "lightblue")

# Histograma e boxplot da vari�vel 'hp'
hist(hp, xlab = "Cavalos de pot�ncia",
     ylab = "Frequ�ncia", main = " ", col = "lightblue")

boxplot(hp, ylab = "Cavalos de pot�ncia")
identify(rep(1,32), hp, labels = nomes)

#   A fun��o 'identify' � utilizada para identificar pontos em um
# gr�fico que foi gerado anteriormente. Para identificar um ponto,
# rode o gr�fico, e depois rode a fun��o 'identify'. Selecione com
# o mouse os pontos a serem identificados, e precione 'esc' quando
# acabar. 
#   � necess�rio cautela ao utilizar esta fun��o pois suas
# coordenadas devem ser as mesmas que foram utilizadas para gerar
# o gr�fico. Neste caso, o eixo X do gr�fico boxplot � composto por
# um vetor de 1's de tamanho 32 (rep(1, 32)) e o eixo Y � formado
# pelos pontos da vari�vel 'hp'. Sem o comando labels = nomes,
# os carros ser�o identificados pela sua posi��o no data frame.
#   Tente rodar o comando abaixo e identificar o mesmo ponto.
boxplot(hp, ylab = "Cavalos de pot�ncia")
identify(rep(1,32), hp)

# Histograma e boxplot da vari�vel 'wt'
hist(wt, xlab = "Peso (1000 lbs)", ylab = "Frequ�ncia", main = " ",
     col = "lightblue")

boxplot(wt, ylab = "Peso (1000 lbs)")
identify(rep(1,32), wt, labels = nomes)

# Gr�fico de barras da vari�vel 'vs'
barplot(table(vs), xlab = "Disposi��o dos cilindros",
        ylab = "Frequ�ncia", col = "lightblue", 
        names.arg = c("Em forma de V", "Em linha"))

# Gr�fico de barras da vari�vel 'am'
barplot(table(am), xlab = "Tipo de transmis�o",
        ylab = "Frequ�ncia", col = "lightblue", 
        names.arg = c("Autom�tico", "Manual"))

#############################
### An�lise bidimensional ###
#############################

#   O interesse principal consiste em relacionar a vari�vel
# resposta 'mpg' com as demais vari�veis. 

# Gr�fico de dispers�o entre a vari�vel 'mpg' e 'cyl'
plot(cyl, mpg, xlab = "N�mero de cilindros", 
     ylab = "Performance (milhas/gal�o)", pch = 16)

# Coeficiente de correla��o de Pearson
cor(cyl, mpg)

# OBS: Uma correla��o forte entre as vari�veis N�O IMPLICA 
# necessariamente causualidade!!! 

# Veja alguns exemplos de correla��es absurdas no site abaixo 
# https://www1.folha.uol.com.br/ciencia/2015/05/1626815-quando-nicolas-cage-faz-filmes-mortes-sao-evitadas-veja-outras-correlacoes-estatisticas-que-mentem.shtml

# Gr�fico de dispers�o entre a vari�vel 'mpg' e 'hp'
plot(hp, mpg, xlab = "Cavalos de pot�ncia", 
     ylab = "Performance (milhas/gal�o)", pch = 16)

# Coeficiente de correla��o de Pearson
cor(hp, mpg)

# Gr�fico de dispers�o entre a vari�vel 'mpg' e 'wt'
plot(wt, mpg, xlab = "Peso", 
     ylab = "Performance (milhas/gal�o)", pch = 16)

# Coeficiente de correla��o de Pearson
cor(wt, mpg)

# boxplot da vari�vel 'mpg' conforme a disposi��o dos cilindros
boxplot(mpg ~ vs, xlab = "Disposi��o dos cilindros",
        ylab = "Performance (milhas/gal�o)",
        names = c("Em forma de V", "Em linha"))

# boxplot da vari�vel 'mpg' conforme o tipo de transmis�o
boxplot(mpg ~ vs, xlab = "Tipo de transmiss�o",
        ylab = "Performance (milhas/gal�o)",
        names = c("Autom�tico", "Manual"))

#   Para estudar a associa��o entre a vari�vel 'mpg' e as vari�veis
# do tipo fator 'vs' e 'am', iremos agrupar a performance
# observada dos autom�veis nas seguintes classes (10 15], (15, 20],
# (20, 25], (25, 30] e (30, 35].
mpg.agrupado <- cut(mpg, breaks = c(10, 15, 20, 25, 30, 35))

# Para ver o n�mero de observa��es em cada classe
table(mpg.agrupado)

#   Perceba que uma das classes ficou com apenas 2 observa��es.
# Para evitar problemas inferenciais posteriores (aproxima��es
# ruins da distribui��o de refer�ncia utilizada), iremos agrupar
# as classes (25, 30] e (30, 35].
mpg.agrupado <- cut(mpg, breaks = c(10, 15, 20, 25, 35))

# Para ver o n�mero de observa��es em cada classe
table(mpg.agrupado)

# Tabela de conting�ncia da vari�vel 'mpg.agrupado' com 'vs'
addmargins(table(mpg.agrupado, vs))

#   Perceba que uma das classes n�o possui observa��es, e outra com
# apenas uma! Precisamos agrupar as classes (10, 15] e (15, 20], e
# tamb�m as classes (20, 25] e (25, 35] para obter uma aproxima��o
# melhor.
mpg.agrupado <- cut(mpg, breaks = c(10, 20, 35))

# Para ver o n�mero de observa��es em cada classe
table(mpg.agrupado)

# Tabela de conting�ncia da vari�vel 'mpg.agrupado' com 'vs'
addmargins(table(mpg.agrupado, vs))

# Gr�fico de barras
barplot(table(vs, mpg.agrupado),
        xlab = "Performance (milhas/gal�o)",
        ylab = "Frequ�ncia",
        legend.text = TRUE,
        args.legend = list(x = "top", legend = c("Em forma de V", "Em linha"),
                           bty = "n"),
        col = c("gray90", "gray20"), beside = TRUE)

# Estat�stica X�
chisq.test(vs, mpg.agrupado)

# Tabela de conting�ncia da vari�vel 'mpg.agrupado' com 'am'
table(mpg.agrupado, am)

# Gr�fico de barras
barplot(table(am, mpg.agrupado),
        xlab = "Performance (milhas/gal�o)",
        ylab = "Frequ�ncia",
        legend.text = TRUE,
        args.legend = list(x = "top", legend = c("Autom�tico", "Manual"),
                           bty = "n"),
        col = c("gray90", "gray20"), beside = TRUE)

# Estat�stica X�
chisq.test(vs, mpg.agrupado)






