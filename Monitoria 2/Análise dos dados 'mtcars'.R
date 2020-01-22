###################################################################
#                                                                 #
#                 Curso de Verão - IME USP 2020                   #
#                                                                 #
#             Análise do conjunto de dados 'mtcars'               #
#                                                                 #
#  Autor: Rodrigo Matheus                                         # 
#  Instituto: IME USP                                             #
##################################################################

###################################################################
# 1 Leitura e formatação                                          #
##################################################################

# Leitura
data("mtcars")

# Visualização inicial 
head(mtcars)

# Descrição
?mtcars

# Formatação
mtcars$vs <- factor(mtcars$vs, labels = c("forma de v", "em linha"))
mtcars$am <- factor(mtcars$am, labels = c("automatico", "manual"))

# OBS: Exclusão das variáveis 'disp', 'drat', 'qsec', 'gear' e carb'
mtcars <- mtcars[, -c(3, 5, 7, 10, 11)]

head(mtcars)

# Estrutura do banco de dados
str(mtcars)

# Variável resposta: 'mpg'
# Variáveis quantitativas: 'mpg', 'cyl', 'hp' e 'wt'
# Variáveis qualitativas: 'vs' e 'am' (ambas em escala nominal)

# Disponibilização
attach(mtcars)

###################################################################
# 2 Análise exploratória                                          #
##################################################################

# Guardando os nomes dos carros em um objeto
nomes <- rownames(mtcars)
nomes

# Resumo inicial
summary(mtcars)

# Desvio padrão
sd(mpg)
sd(cyl)
sd(hp)
sd(wt)

##############################
### Análise unidimensional ###
##############################

# Histograma e boxplot da variável 'mpg'
hist(mpg, xlab = "Performance (milhas/galão)", ylab = "Frequência",
     col = "lightblue", main = " ")

boxplot(mpg, ylab = "Performance (milhas/galão)")

# Gráfico de barras da variável 'cyl'
barplot(table(cyl), xlab = "Número de cilindros", ylab = "Frequência",
     col = "lightblue")

# Histograma e boxplot da variável 'hp'
hist(hp, xlab = "Cavalos de potência",
     ylab = "Frequência", main = " ", col = "lightblue")

boxplot(hp, ylab = "Cavalos de potência")
identify(rep(1,32), hp, labels = nomes)

#   A função 'identify' é utilizada para identificar pontos em um
# gráfico que foi gerado anteriormente. Para identificar um ponto,
# rode o gráfico, e depois rode a função 'identify'. Selecione com
# o mouse os pontos a serem identificados, e precione 'esc' quando
# acabar. 
#   É necessário cautela ao utilizar esta função pois suas
# coordenadas devem ser as mesmas que foram utilizadas para gerar
# o gráfico. Neste caso, o eixo X do gráfico boxplot é composto por
# um vetor de 1's de tamanho 32 (rep(1, 32)) e o eixo Y é formado
# pelos pontos da variável 'hp'. Sem o comando labels = nomes,
# os carros serão identificados pela sua posição no data frame.
#   Tente rodar o comando abaixo e identificar o mesmo ponto.
boxplot(hp, ylab = "Cavalos de potência")
identify(rep(1,32), hp)

# Histograma e boxplot da variável 'wt'
hist(wt, xlab = "Peso (1000 lbs)", ylab = "Frequência", main = " ",
     col = "lightblue")

boxplot(wt, ylab = "Peso (1000 lbs)")
identify(rep(1,32), wt, labels = nomes)

# Gráfico de barras da variável 'vs'
barplot(table(vs), xlab = "Disposição dos cilindros",
        ylab = "Frequência", col = "lightblue", 
        names.arg = c("Em forma de V", "Em linha"))

# Gráfico de barras da variável 'am'
barplot(table(am), xlab = "Tipo de transmisão",
        ylab = "Frequência", col = "lightblue", 
        names.arg = c("Automático", "Manual"))

#############################
### Análise bidimensional ###
#############################

#   O interesse principal consiste em relacionar a variável
# resposta 'mpg' com as demais variáveis. 

# Gráfico de dispersão entre a variável 'mpg' e 'cyl'
plot(cyl, mpg, xlab = "Número de cilindros", 
     ylab = "Performance (milhas/galão)", pch = 16)

# Coeficiente de correlação de Pearson
cor(cyl, mpg)

# OBS: Uma correlação forte entre as variáveis NÃO IMPLICA 
# necessariamente causualidade!!! 

# Veja alguns exemplos de correlações absurdas no site abaixo 
# https://www1.folha.uol.com.br/ciencia/2015/05/1626815-quando-nicolas-cage-faz-filmes-mortes-sao-evitadas-veja-outras-correlacoes-estatisticas-que-mentem.shtml

# Gráfico de dispersão entre a variável 'mpg' e 'hp'
plot(hp, mpg, xlab = "Cavalos de potência", 
     ylab = "Performance (milhas/galão)", pch = 16)

# Coeficiente de correlação de Pearson
cor(hp, mpg)

# Gráfico de dispersão entre a variável 'mpg' e 'wt'
plot(wt, mpg, xlab = "Peso", 
     ylab = "Performance (milhas/galão)", pch = 16)

# Coeficiente de correlação de Pearson
cor(wt, mpg)

# boxplot da variável 'mpg' conforme a disposição dos cilindros
boxplot(mpg ~ vs, xlab = "Disposição dos cilindros",
        ylab = "Performance (milhas/galão)",
        names = c("Em forma de V", "Em linha"))

# boxplot da variável 'mpg' conforme o tipo de transmisão
boxplot(mpg ~ vs, xlab = "Tipo de transmissão",
        ylab = "Performance (milhas/galão)",
        names = c("Automático", "Manual"))

#   Para estudar a associação entre a variável 'mpg' e as variáveis
# do tipo fator 'vs' e 'am', iremos agrupar a performance
# observada dos automóveis nas seguintes classes (10 15], (15, 20],
# (20, 25], (25, 30] e (30, 35].
mpg.agrupado <- cut(mpg, breaks = c(10, 15, 20, 25, 30, 35))

# Para ver o número de observações em cada classe
table(mpg.agrupado)

#   Perceba que uma das classes ficou com apenas 2 observações.
# Para evitar problemas inferenciais posteriores (aproximações
# ruins da distribuição de referência utilizada), iremos agrupar
# as classes (25, 30] e (30, 35].
mpg.agrupado <- cut(mpg, breaks = c(10, 15, 20, 25, 35))

# Para ver o número de observações em cada classe
table(mpg.agrupado)

# Tabela de contingência da variável 'mpg.agrupado' com 'vs'
addmargins(table(mpg.agrupado, vs))

#   Perceba que uma das classes não possui observações, e outra com
# apenas uma! Precisamos agrupar as classes (10, 15] e (15, 20], e
# também as classes (20, 25] e (25, 35] para obter uma aproximação
# melhor.
mpg.agrupado <- cut(mpg, breaks = c(10, 20, 35))

# Para ver o número de observações em cada classe
table(mpg.agrupado)

# Tabela de contingência da variável 'mpg.agrupado' com 'vs'
addmargins(table(mpg.agrupado, vs))

# Gráfico de barras
barplot(table(vs, mpg.agrupado),
        xlab = "Performance (milhas/galão)",
        ylab = "Frequência",
        legend.text = TRUE,
        args.legend = list(x = "top", legend = c("Em forma de V", "Em linha"),
                           bty = "n"),
        col = c("gray90", "gray20"), beside = TRUE)

# Estatística X²
chisq.test(vs, mpg.agrupado)

# Tabela de contingência da variável 'mpg.agrupado' com 'am'
table(mpg.agrupado, am)

# Gráfico de barras
barplot(table(am, mpg.agrupado),
        xlab = "Performance (milhas/galão)",
        ylab = "Frequência",
        legend.text = TRUE,
        args.legend = list(x = "top", legend = c("Automático", "Manual"),
                           bty = "n"),
        col = c("gray90", "gray20"), beside = TRUE)

# Estatística X²
chisq.test(vs, mpg.agrupado)






