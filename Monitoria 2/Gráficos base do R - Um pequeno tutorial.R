###################################################################
#                                                                 #
#                 Curso de Verão - IME USP 2020                   #
#                                                                 #
#             Gráficos base do R: Um pequeno tutorial             #
#                                                                 #
#  Autor: Rodrigo Matheus                                         # 
#  Instituto: IME USP                                             #
##################################################################

# Sumário
#   
# 1 Conjunto de dados de exemplo
#   - Descrição dos dados PlantGrowth
# 2 Gráficos
#   2.1 Gráficos para variáveis quantitativas
#       - Histograma
#       - Boxplot
#       - Análise bivariada entre uma variável quantitativa
#         e uma qualitativa com o boxplot
#   2.2 Gráficos para variáveis qualitativas
#       - Gráfico de setores (pizza)
#       - Gráfico de barras
#       - Análise bivariada entre duas variáveis qualitativas
#         com o gráfico de barras

###################################################################
# 1 Conjunto de dados de exemplo                                  #
##################################################################

#   O R possui vários conjuntos de dados disponíveis. Para acessá-los
# é necessário utilizar a função 'data'. Para visualizar os dados
# disponíveis no R, basta rodar o seguinte comando (no RStudio):
data()

# Por exemplo, vamos utilizar o conjunto de dados 'PlantGrowth'.
data("PlantGrowth")

# Descrição (help)
?PlantGrowth

#   De acordo com o 'help' do conjunto de dados, temos as seguintes 
# informações sobre as variáveis disponíveis:

# weight: Peso da planta (Unidade não informada)
# group:  Tratamentos ao qual a planta foi submetida. Esta variável
#        é um fator com níveis 'ctrl', 'trt1' e 'trt2' reprensentando,
#        respectivamente, os grupos de controle, tratamento 1 e o
#        tratamento 2.

# Visualização inicial (6 primeiras linhas)
head(PlantGrowth)

# Disponibilização
attach(PlantGrowth)

###################################################################
# 2 Gráficos                                                      #
##################################################################

#### 2.1 Gráficos para variáveis quantitativas ####

##############
# Histograma #
##############

# Função: hist
?hist 

# Uso básico (Não rodar o comando abaixo)
hist('variavel', xlab = "Legenda do eixo X",
     ylab = "Legenda do eixo Y",
     main = "Título",
     col = "Cor")

# Por exemplo
hist(weight, xlab = "Peso da planta", ylab = "Frequência",
     main = " ", col = "lightseagreen")

# OBS: Utilizei o argumento: main = " " para deixar o histograma
# sem um título central. 

# OBS: As cores podem ser identificadas por números (1 a 8) ou por
# nome. Rode o comando abaixo para visualizar as cores e os seus 
# respectivos números
barplot(1:8, col = 1:8, names.arg = 1:8)
#   Para visualizar uma lista com o nome das cores que podem ser
# utilizadas no R, rode o seguinte comando
colors()

##############
# Boxplot    #
##############

# Função: boxplot
?boxplot

# Uso básico (Não rodar o comando abaixo)
boxplot('variavel', xlab = "Legenda do eixo X",
        ylab = "Legenda do eixo Y",
        col = "Cor")

# Por exemplo
boxplot(weight, ylab = "Peso da planta", col = "lightblue")


# Análise bivariada entre uma variável quantitativa
#         e uma qualitativa com o boxplot

#   O boxplot permite que seja realizada uma análise bivariada
# entre uma variável QUANTITATIVA e uma QUALITATIVA. Geralmente, a
# variável quantitativa é a variável resposta observada, enquanto que
# a qualitativa é um fator com alguns níveis, e existe o interesse
# em analisar a distribuição da resposta em cada nível deste fator.

# Uso básico (Não rodar o comando abaixo)
boxplot('resposta' ~ 'fator', xlab = "Legenda do eixo X",
        ylab = "Legenda do eixo Y",
        names = c('Um vetor com a identificação de cada nível do
        fator'),
        col = "Cor")

# OBS: Antes de colocar a identificação de cada nível do fator no 
# boxplot, veja qual a ordem de entrada deles no gráfico.

#   Neste conjunto de dados temos a variável 'weight' (quantitativa)
# e 'group' (qualitativa). Aqui, podemos estar interessados em
# analisar a distribuição do peso das plantas de acordo com cada
# tratamento aplicado.

# Por exemplo
boxplot(weight ~ group)

#   Aqui a ordem de entrada dos níveis do fator 'group' é 'ctrl',
# 'trt1' e 'trt2'.
boxplot(weight ~ group, xlab = "Grupo", ylab = "Peso da planta",
        names = c("Controle", "Trat 1", "Trat 2"), col = "lightblue")

# ou
boxplot(weight ~ group, xlab = "Grupo", ylab = "Peso da planta",
        names = c("Controle", "Trat 1", "Trat 2"),
        col = c("white", "lightblue", "seagreen"))

# OBS: No histograma, as observações da resposta são identificadas no
# eixo X, enquanto que no boxplot são identificadas no eixo Y.

#### 2.2 Gráficos para variáveis qualitativas ####

######################
# Gráfico de setores #
######################

# Função: pie
?pie

# Uso básico (Não rodar o comando abaixo)
pie(table('fator'),
    labels = c("Um vetor com a legenda dos níveis do fator"),
    radius = "Tamanho do raio (por padrão é 0.8)",
    col = c("Um vetor de cores para os níveis do fator"))

# Por exemplo
pie(table(group),
    labels = c("Controle", "Trat 1", "Trat 2"),
    radius = 1,
    col = c("white", "lightblue", "seagreen"))

#####################
# Gráfico de barras #
#####################

# Função: barplot
?barplot

# Uso básico (Não rodar o comando abaixo)
barplot(table('fator'), xlab = "Legenda do eixo X",
        ylab = "Legenda do eixo Y",
        names.arg = c('Um vetor com a identificação de cada nível do
        fator'),
        col = "Cor")

# Por exemplo
barplot(table(group), xlab = "Grupo",
        ylab = "Frequência",
        names.arg = c("Controle", "Trat 1", "Trat 2"),
        col = "lightblue")

# OBS: O gráfico de barras também pode ser utilizado em variáveis
# quantitativas DISCRETAS com uma amplitude baixa de valores. 

#######################################################
# Análise bivariada entre duas variáveis qualitativas #
#         com o gráfico de barras                     #
#######################################################

#   A fim de exemplificar uma análise bivariada entre duas variá-
# veis QUALITATIVAS com a função 'barplot', considere o acréscimo
# (artificial !!!) da variável 'species' ao conjunto de dados.
set.seed(1234)
species <- as.factor(sample(c("type 1","type 2","type 3","type 4"),
                         30, replace = TRUE))
species

# Uso básico (Não rodar o comando abaixo)
barplot(table('fator1', 'fator2'),
        xlab = "Legenda do eixo X (fator2)",
        ylab = "Legenda do eixo Y",
        legend.text = TRUE,
        args.legend = list(legend = c('Um vetor com a identificação de cada nível do fator 1')),
        names.arg = c('Um vetor com a identificação de cada nível do fator 2'),
        col = c("Um vetor de cores para os níveis do fator 1"))

# Por exemplo
barplot(table(group, species), xlab = "Espécie",
        ylab = "Frequência", 
        legend.text = TRUE, 
        args.legend = list(legend = c("Controle", "Trat 1", "Trat 2")),
        names.arg = c("Tipo 1", "Tipo 2", "Tipo 3", "Tipo 4"),
        col = c("gray20", "gray60", "gray80"))

#   Para melhorar a visualização da legenda, podemos colocar as barras
# ao lado, ao invés de empilhá-las com o comando beside = TRUE
barplot(table(group, species), xlab = "Espécie",
        ylab = "Frequência", 
        legend.text = TRUE,
        args.legend = list(legend = c("Controle", "Trat 1", "Trat 2")),
        names.arg = c("Tipo 1", "Tipo 2", "Tipo 3", "Tipo 4"),
        col = c("gray20", "gray60", "gray80"),
        beside = TRUE)

#   Para trocar a legenda da direita para a esquerda utilize o comando
# x = "topleft" antes da legenda dos níveis do fator 1 da seguinte
# forma:
barplot(table(group, species), xlab = "Espécie",
        ylab = "Frequência", 
        legend.text = TRUE,
        args.legend = list(x = "topleft", legend = c("Controle", "Trat 1", "Trat 2")),
        names.arg = c("Tipo 1", "Tipo 2", "Tipo 3", "Tipo 4"),
        col = c("gray20", "gray60", "gray80"),
        beside = TRUE)

#   Por fim, para retirar a caixa de contorno deta legenda, ainda po-
# demos utilizar o comando bty = "n" após a legenda dos níveis do 
# fator 1 da forma
barplot(table(group, species), xlab = "Espécie",
        ylab = "Frequência", 
        legend.text = TRUE,
        args.legend = list(x = "topleft",
                           legend = c("Controle", "Trat 1", "Trat 2"),
                              bty = "n"),
        names.arg = c("Tipo 1", "Tipo 2", "Tipo 3", "Tipo 4"),
        col = c("gray20", "gray60", "gray80"), beside = TRUE)
