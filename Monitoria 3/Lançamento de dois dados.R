###################################################################
#                                                                 #
#                 Curso de Ver�o - IME USP 2020                   #
#                                                                 #
#             Probabilidade de eventos equiprov�veis              #
#                                                                 #
#  Autor: Rodrigo Matheus                                         # 
#  Instituto: IME USP                                             #
##################################################################

# Experimento aleat�rio: Lan�amento de dois dados

dado1 <- sample(1:6, size = 100, replace = TRUE)
dado2 <- sample(1:6, size = 100, replace = TRUE)

barplot(prop.table(table(dado1)), xlab = "Lan�amento do dado 1",
        ylab = "Propor��o",
        col = "lightblue")
abline(h = 1/6, col = 2)

barplot(prop.table(table(dado2)), xlab = "Lan�amento do dado 2",
        ylab = "Propor��o",
        col = "lightgreen")
abline(h = 1/6, col = 2)

# Propor��o de vezes em que foram obtidas faces iguais
mean(dado1 == dado2)

# Propor��o de vezes em que a soma dos resultados foi igual a 10
mean(dado1 + dado2 == 10)

# Propor��o de vezes em que a soma dos resultados foi menor do que 5
mean(dado1 + dado2 < 5)
     
# Propor��o de vezes em que uma face foi o dobro da outra
mean( (dado1 == 2*dado2) | (dado2 == 2*dado1))