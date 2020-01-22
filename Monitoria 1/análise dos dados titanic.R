###################################################################
#                                                                 #
#                 Curso de Verão - IME USP 2020                   #
#                                                                 #
#             Análise do conjunto de dados 'titanic'              #
#                                                                 #
#  Autor: Rodrigo Matheus                                         # 
#  Instituto: IME USP                                             #
##################################################################

# Principal referência: 
# MALIK, S. (2019). Data Analysis and Visualisations using R.
# Disponível em:
# https://towardsdatascience.com/data-analysis-and-visualisations-using-r-955a7e90f7dd

###################################################################
# 1 Leitura dos dados                                             #
##################################################################

# Link dos dados
# https://github.com/Rodrigo-sgj/verao2020

# Leitura 
titanic <- read.table("~/USP/Curso de verão/titanic.txt")
titanic

# Disponibilização das variáveis do data frame 'titanic
attach(titanic)

# OBS: Não é recomendado utilizar o comando 'attach' quando mais
# de um conjunto de dados estiver sendo analisado.

###################################################################
# 2 Conhecendo o conjunto de dados                                #
##################################################################

### Variáveis ###

# sobrev - 0 se o passageiro não sobreviveu; 1 caso contrário;
# classe - Classe do passageiro; (1a, 2a ou 3a classe);
# genero - Gênero; (feminino ou masculino);
# idade  - Idade;
# tarifa - Tarifa;
# porto - Porto de embarque (C: Cherbourg, Q: Queenstown, S: Southhampton e O: outro)

### Dimensão dos dados ###
dim(titanic)

# Qual o tamanho amostral?
# Quantas variáveis temos?

#### Visualização das primeiras linhas ###
head(titanic) # Por padrão, é apresentado as 6 primeiras
head(titanic, n = 10) # Para aumentar o número de linhas

#### Visualização das últimas linhas ###
tail(titanic)
tail(titanic, n = 10)

### Visualização dos nomes das variáveis ###
names(titanic)

### Estrutura do conjunto de dados ###
str(titanic)

#  Descreva quais variáveis são quantitativas, e identifique o
# tipo de variável (discreta ou contínua).

#  Descreva quais variáveis são qualitativas, e identifique o
# tipo de variável (nominal ou ordinal).

###################################################################
# 3 Análise descritiva e visualização                             #
##################################################################

### Resumos ###

# Resumo geral
summary(titanic)

# Observe que a função 'summary' retorna quantidades diferentes
# a depender do tipo da variável (quantitativa ou qualitativa).

# Também podemos fazer resumos individuais, por exemplo
summary(idade)

# Interprete a média da variável 'sobrev'.
# Interprete os resultados das variáveis quantitativas 'idade' e
# 'tarifa'.

# NA, significa 'Not Available'.
# O termos NA's : 177 no resumo da variável 'idade' que dizer
# que não temos a informação da idade de 177 passageiros.

### Medidas de posição (Variáveis quantitativas) ###

# Mínimo
min(tarifa)

# Máximo
max(tarifa)

# Média
mean(tarifa)

# Mediana
median(tarifa)

# Quartis
quantile(tarifa)
quantile(tarifa, probs = 0.10) # Somente o percentil 10

# OBS: Variáveis com dados faltantes
mean(idade)
mean(idade, na.rm = TRUE) # O comando na.rm = TRUE é utilizado
# quando deseja-se ignorar o dado faltante. OBS: Esta nem sempre
# é a melhor opção.

### Medidas de dispersão (Variáveis quantitativas) ###

# Amplitude
diff(range(tarifa))

# Variância
var(tarifa)

# Desvio-padrão
sd(tarifa)

### Tabela de frequências e proporções (Variáveis qualitativas) ###

# Frequências
table(sobrev)
table(classe)
table(genero)
table(porto)

# Proporções 
prop.table(table(sobrev))
prop.table(table(classe))
prop.table(table(genero))
prop.table(table(porto))

### Agrupando variáveis (Análise bidimensional) ###

# Grupo: Faixa etária
table(cut(idade, c(0,18,40,60,100)))

# Mudando os extremos da classe
table(cut(idade, c(0,18,40,60,100), right = FALSE))

# Adicionando a classe do passageiro
table(classe, cut(idade, c(0,18,40,60,100)))

# Transpondo a visualização
t(table(classe, cut(idade, c(0,18,40,60,100))))

### Visualização ###

# Análise univariada das variáveis qualitativas

# Gráfico de barras da variável 'sobrev'
barplot(table(sobrev))

# Melhorando o gráfico
barplot(table(sobrev), xlab = "Sobrevivência",
        ylab = "Número de passageiros",
        names.arg = c("Não", "Sim"), col = "lightblue")

# Gráfico de barras da variável 'classe'
barplot(table(classe), xlab = "Classe",
        ylab = "Número de passageiros",
        names.arg = c("1a", "2a", "3a"), col = "lightblue")

# Gráfico de barras da variável 'genero'
barplot(table(genero), xlab = "Gênero",
        ylab = "Número de passageiros",
        names.arg = c("Feminino", "Masculino"), col = "lightblue")

# Gráfico de barras da variável 'porto'
barplot(table(porto), xlab = "Porto",
        ylab = "Número de passageiros",
        names.arg = c("C", "O", "Q", "S"), col = "lightblue")

# Análise univariada das variáveis quantitativas

# Histograma da variável 'idade'
hist(idade, xlab = "Idade",
     ylab = "Frequência", main = " ",
     col = "lightblue")

# boxplot da variável idade
boxplot(idade, ylab = "Idade")

# Gráfico de barras da variável idade agrupada
idade.agupada <- table(cut(idade, c(0,18,40,60,100)))
barplot(idade.agupada, xlab = "Faixa etária",
        ylab = "Número de passageiros", col = "lightblue")

# Histograma da variável 'tarifa'
hist(tarifa, xlab = "Tarifa",
     ylab = "Frequência", main = " ",
     col = "lightblue")

# boxplot da variável 'tarifa'
boxplot(tarifa, ylab = "Tarifa")

# Análise bivariada

# Sobrevivência segundo a classe
barplot(table(sobrev, classe))

# Melhorando
barplot(table(sobrev, classe), beside = TRUE, 
        xlab = "Classe", ylab = "Número de passageiros",
        col = c("gray30", "gray90"))
legend("topleft", legend = c("Não sobreviveu", "Sobreviveu"),
       fill = c("gray30", "gray90"), bty = "n")

# Sobrevivência segundo o gênero
barplot(table(sobrev, genero), beside = TRUE, xlab = "Gênero",
        ylab = "Número de passageiros", col = c("gray30", "gray90"))
legend("topleft", legend = c("Não sobreviveu", "Sobreviveu"),
       fill = c("gray30", "gray90"), bty = "n")

# Sobrevivência segundo a faixa etária
barplot(table(sobrev, cut(idade, c(0,18,40,60,100))),
        beside = TRUE, xlab = "Faixa etária",
        ylab = "Número de passageiros",
        col = c("gray30", "gray90"))
legend("topright", legend = c("Não sobreviveu", "Sobreviveu"),
       fill = c("gray30", "gray90"), bty = "n")

# Sobrevivência segundo o porto
barplot(table(sobrev, porto),
        beside = TRUE, xlab = "Porto",
        ylab = "Número de passageiros",
        col = c("gray30", "gray90"))
legend("topleft", legend = c("Não sobreviveu", "Sobreviveu"),
       fill = c("gray30", "gray90"), bty = "n")

# Boxplot da tarifa de acordo com a sobrevivência
boxplot(tarifa ~ sobrev, xlab = "Gênero", ylab = "Tarifa")

# Boxplot da tarifa de acordo com a classe
boxplot(tarifa ~ classe, xlab = "Classe", ylab = "Tarifa")

# Boxplot da tarifa de acordo com o gênero
boxplot(tarifa ~ genero, xlab = "Gênero", ylab = "Tarifa")

# Boxplot da tarifa de acordo com o porto
boxplot(tarifa ~ porto, xlab = "Porto", ylab = "Tarifa")

# Gráfico de dispesão da tarifa segundo a idade
plot(idade, tarifa, xlab = "Idade", ylab = "Tarifa")

