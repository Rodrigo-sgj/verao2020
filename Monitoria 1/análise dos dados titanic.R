###################################################################
#                                                                 #
#                 Curso de Ver�o - IME USP 2020                   #
#                                                                 #
#             An�lise do conjunto de dados 'titanic'              #
#                                                                 #
#  Autor: Rodrigo Matheus                                         # 
#  Instituto: IME USP                                             #
##################################################################

# Principal refer�ncia: 
# MALIK, S. (2019). Data Analysis and Visualisations using R.
# Dispon�vel em:
# https://towardsdatascience.com/data-analysis-and-visualisations-using-r-955a7e90f7dd

###################################################################
# 1 Leitura dos dados                                             #
##################################################################

# Link dos dados
# https://github.com/Rodrigo-sgj/verao2020

# Leitura 
titanic <- read.table("~/USP/Curso de ver�o/titanic.txt")
titanic

# Disponibiliza��o das vari�veis do data frame 'titanic
attach(titanic)

# OBS: N�o � recomendado utilizar o comando 'attach' quando mais
# de um conjunto de dados estiver sendo analisado.

###################################################################
# 2 Conhecendo o conjunto de dados                                #
##################################################################

### Vari�veis ###

# sobrev - 0 se o passageiro n�o sobreviveu; 1 caso contr�rio;
# classe - Classe do passageiro; (1a, 2a ou 3a classe);
# genero - G�nero; (feminino ou masculino);
# idade  - Idade;
# tarifa - Tarifa;
# porto - Porto de embarque (C: Cherbourg, Q: Queenstown, S: Southhampton e O: outro)

### Dimens�o dos dados ###
dim(titanic)

# Qual o tamanho amostral?
# Quantas vari�veis temos?

#### Visualiza��o das primeiras linhas ###
head(titanic) # Por padr�o, � apresentado as 6 primeiras
head(titanic, n = 10) # Para aumentar o n�mero de linhas

#### Visualiza��o das �ltimas linhas ###
tail(titanic)
tail(titanic, n = 10)

### Visualiza��o dos nomes das vari�veis ###
names(titanic)

### Estrutura do conjunto de dados ###
str(titanic)

#  Descreva quais vari�veis s�o quantitativas, e identifique o
# tipo de vari�vel (discreta ou cont�nua).

#  Descreva quais vari�veis s�o qualitativas, e identifique o
# tipo de vari�vel (nominal ou ordinal).

###################################################################
# 3 An�lise descritiva e visualiza��o                             #
##################################################################

### Resumos ###

# Resumo geral
summary(titanic)

# Observe que a fun��o 'summary' retorna quantidades diferentes
# a depender do tipo da vari�vel (quantitativa ou qualitativa).

# Tamb�m podemos fazer resumos individuais, por exemplo
summary(idade)

# Interprete a m�dia da vari�vel 'sobrev'.
# Interprete os resultados das vari�veis quantitativas 'idade' e
# 'tarifa'.

# NA, significa 'Not Available'.
# O termos NA's : 177 no resumo da vari�vel 'idade' que dizer
# que n�o temos a informa��o da idade de 177 passageiros.

### Medidas de posi��o (Vari�veis quantitativas) ###

# M�nimo
min(tarifa)

# M�ximo
max(tarifa)

# M�dia
mean(tarifa)

# Mediana
median(tarifa)

# Quartis
quantile(tarifa)
quantile(tarifa, probs = 0.10) # Somente o percentil 10

# OBS: Vari�veis com dados faltantes
mean(idade)
mean(idade, na.rm = TRUE) # O comando na.rm = TRUE � utilizado
# quando deseja-se ignorar o dado faltante. OBS: Esta nem sempre
# � a melhor op��o.

### Medidas de dispers�o (Vari�veis quantitativas) ###

# Amplitude
diff(range(tarifa))

# Vari�ncia
var(tarifa)

# Desvio-padr�o
sd(tarifa)

### Tabela de frequ�ncias e propor��es (Vari�veis qualitativas) ###

# Frequ�ncias
table(sobrev)
table(classe)
table(genero)
table(porto)

# Propor��es 
prop.table(table(sobrev))
prop.table(table(classe))
prop.table(table(genero))
prop.table(table(porto))

### Agrupando vari�veis (An�lise bidimensional) ###

# Grupo: Faixa et�ria
table(cut(idade, c(0,18,40,60,100)))

# Mudando os extremos da classe
table(cut(idade, c(0,18,40,60,100), right = FALSE))

# Adicionando a classe do passageiro
table(classe, cut(idade, c(0,18,40,60,100)))

# Transpondo a visualiza��o
t(table(classe, cut(idade, c(0,18,40,60,100))))

### Visualiza��o ###

# An�lise univariada das vari�veis qualitativas

# Gr�fico de barras da vari�vel 'sobrev'
barplot(table(sobrev))

# Melhorando o gr�fico
barplot(table(sobrev), xlab = "Sobreviv�ncia",
        ylab = "N�mero de passageiros",
        names.arg = c("N�o", "Sim"), col = "lightblue")

# Gr�fico de barras da vari�vel 'classe'
barplot(table(classe), xlab = "Classe",
        ylab = "N�mero de passageiros",
        names.arg = c("1a", "2a", "3a"), col = "lightblue")

# Gr�fico de barras da vari�vel 'genero'
barplot(table(genero), xlab = "G�nero",
        ylab = "N�mero de passageiros",
        names.arg = c("Feminino", "Masculino"), col = "lightblue")

# Gr�fico de barras da vari�vel 'porto'
barplot(table(porto), xlab = "Porto",
        ylab = "N�mero de passageiros",
        names.arg = c("C", "O", "Q", "S"), col = "lightblue")

# An�lise univariada das vari�veis quantitativas

# Histograma da vari�vel 'idade'
hist(idade, xlab = "Idade",
     ylab = "Frequ�ncia", main = " ",
     col = "lightblue")

# boxplot da vari�vel idade
boxplot(idade, ylab = "Idade")

# Gr�fico de barras da vari�vel idade agrupada
idade.agupada <- table(cut(idade, c(0,18,40,60,100)))
barplot(idade.agupada, xlab = "Faixa et�ria",
        ylab = "N�mero de passageiros", col = "lightblue")

# Histograma da vari�vel 'tarifa'
hist(tarifa, xlab = "Tarifa",
     ylab = "Frequ�ncia", main = " ",
     col = "lightblue")

# boxplot da vari�vel 'tarifa'
boxplot(tarifa, ylab = "Tarifa")

# An�lise bivariada

# Sobreviv�ncia segundo a classe
barplot(table(sobrev, classe))

# Melhorando
barplot(table(sobrev, classe), beside = TRUE, 
        xlab = "Classe", ylab = "N�mero de passageiros",
        col = c("gray30", "gray90"))
legend("topleft", legend = c("N�o sobreviveu", "Sobreviveu"),
       fill = c("gray30", "gray90"), bty = "n")

# Sobreviv�ncia segundo o g�nero
barplot(table(sobrev, genero), beside = TRUE, xlab = "G�nero",
        ylab = "N�mero de passageiros", col = c("gray30", "gray90"))
legend("topleft", legend = c("N�o sobreviveu", "Sobreviveu"),
       fill = c("gray30", "gray90"), bty = "n")

# Sobreviv�ncia segundo a faixa et�ria
barplot(table(sobrev, cut(idade, c(0,18,40,60,100))),
        beside = TRUE, xlab = "Faixa et�ria",
        ylab = "N�mero de passageiros",
        col = c("gray30", "gray90"))
legend("topright", legend = c("N�o sobreviveu", "Sobreviveu"),
       fill = c("gray30", "gray90"), bty = "n")

# Sobreviv�ncia segundo o porto
barplot(table(sobrev, porto),
        beside = TRUE, xlab = "Porto",
        ylab = "N�mero de passageiros",
        col = c("gray30", "gray90"))
legend("topleft", legend = c("N�o sobreviveu", "Sobreviveu"),
       fill = c("gray30", "gray90"), bty = "n")

# Boxplot da tarifa de acordo com a sobreviv�ncia
boxplot(tarifa ~ sobrev, xlab = "G�nero", ylab = "Tarifa")

# Boxplot da tarifa de acordo com a classe
boxplot(tarifa ~ classe, xlab = "Classe", ylab = "Tarifa")

# Boxplot da tarifa de acordo com o g�nero
boxplot(tarifa ~ genero, xlab = "G�nero", ylab = "Tarifa")

# Boxplot da tarifa de acordo com o porto
boxplot(tarifa ~ porto, xlab = "Porto", ylab = "Tarifa")

# Gr�fico de dispes�o da tarifa segundo a idade
plot(idade, tarifa, xlab = "Idade", ylab = "Tarifa")

