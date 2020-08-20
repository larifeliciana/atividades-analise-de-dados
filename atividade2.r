#Lista de Atividades 2

#Atribua o valor 133 para X e o valor 36 para Y. 
#Em sequência, adicione a soma de X e Y a Z. 
#Depois, calcule a raiz quadrada de Z e o 
#logaritmo natural do resultado da raiz quadrada. 
#Por fim, arredonde o resultado para zero dígitos. 
#Qual o valor resultante ? Note que a resposta é um número inteiro.

X <- 133
Y <- 36
Z <- X + Y
result <- round(log(sqrt(Z)), 0)
paste0("Q8. R): ", result)

#Pesquise a respeito da “sequência de Fibonacci” e 
#obtenha os cinco primeiros números dessa sequência.
#Qual o logarítimo natural da soma desses cinco números? 
#(Observação: use a função round() para arredondar a 
#resposta de modo que ela tenha apenas três casas decimais) 

result <- round(log(sum(1,1,2,3,5)),3)
paste0("Q9. R) ", result)

#Dada a função f(x) = sin(x) + x. Calcule o valor da 
#derivada de primeira ordem de f(x) quando x=2. 
#(Observação: use a função round() para arredondar a 
#resposta de modo que ela tenha apenas três casas decimais)

x <-2
result <- round(eval(D(expression(sin(x)+x), "x")), 3)
paste0("Q10. R) ", result)

#Calcule o factorial de 10. Com o resultado em mãos,
#calcule o logaritmo de base 10 desse resultado. 
#(Observação: use a função round() para arredondar 
#a resposta de modo que ela tenha apenas duas casas decimais)

result <- round(log(factorial(10), 10), 2)
paste0("Q11. R) ", result)

#Suponha que a velocidade da luz seja c = 300000000 m/s. 
#A equação da equivalência massa-energia de Einstein é dada 
#como E=m*c^2, sendo ‘m’ a massa e ‘c’ a velocidade da luz. 
#Calcule o logarítmo natural do valor da energia originada de 
#um objeto de 10Kg. (Observação: use a função round() para arredondar
#a resposta de modo que ela tenha apenas duas casas decimais)

c <- 300000000
m <- 10
e <- m*c^2
result <- round(log(e), 2)
paste0("Q12. R) ", result)

#Crie um vetor de dados com o seguinte comando da linguagem R:
#v<-c(2,5,7,8,9). #Agora tome o seguinte polinômio f(x) = x^3 + x^2 + x.
# Calcule a média dos valores gerados pela função f(x) quando 
#você substituir a variável ‘x’ do polinômio pelo vetor ‘v’.

v<-c(2,5,7,8,9) 
func <- function(x) {return(x^3+x^2+x)}
result <- mean(func(v))
paste0("Q13. R) ", result)