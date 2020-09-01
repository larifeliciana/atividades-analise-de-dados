#Lista de Atividades 6

#Quais comandos no R retornam um vetor das médias das 
#variáveis 'Sepal.Length', 'Sepal.Width', 'Petal.Length'
#e 'Petal.Width' do dataset iris (já incluído no R) ?

print("Q3. R): ")
apply(iris[ , 1:4], 1, FUN = mean) #Errado, função faz cálculo para linhas e não colunas
apply(iris, 2, FUN = mean) #Errado, retorna E por conter coluna não númerica no frame
colMeans(iris) #Errado, retorna NAs por conter coluna não númerica no frame
apply(iris[ , 1:4], 2, FUN = mean) # Correto
sapply(iris[ , 1:4], 2, FUN = mean) #Errado, não possui argumento MARGIN, então 2 passa como argumento de mean
mapply(iris[ , 1:4], mean) #Errado, função mapply recebe como argumento função e multiplos argumentos
apply(iris[1:4, ], 2, FUN = mean) #Errado, pega primeiras linhas e não as colunas.


#Quias comandos calcula a média do tamanho das pétalas
#(Petal.Length) de acordo com as especies de iris (Species)

print("Q4. R): ")
tapply(iris$Petal.Length, iris$Species, mean) # Correto
tapply(iris[,3], iris$Species, mean) # Correto
with(iris, tapply(Petal.Length, Species, mean)) # Correto
sapply(iris, 2, mean) #Errado, não possui argumento MARGIN
mapply(iris$Petal.Length, iris$Species, mean) #Errado, função mapply recebe como argumento função e multiplos argumentos
mean(iris$Petal.Length, iris$Species) #Errado


#Qual dos seguintes loops não necessita de uma condição no R? *

print("Q5. R): repeat")


#Quantas vezes um loop while (T) {} é executado? 

print("Q6. R): infinitas")


#Qual é o valor de i após o loop for? for (i in 1:4){ } 

print("Q7. R): ")
for (i in 1:4){ } 
print(i)


#Qual é o valor de i após o loop for? for (i in 1:4){ break }

print("Q8. R): ")
for (i in 1:4){ break }
print(i)


#Qual é o valor de i após o loop for? for (i in 1:4 {next }

print("Q9. R): ")
for (i in 1:4) {next }
print(i)


#Use o 'mapply' para obter uma lista de 10 elementos. 
#A lista é uma alternação entre 'Rural' e 'Amo'. 
#O comprimento desses 10 elementos diminuem de 10 para 1
#(ver abaixo a saída). OBS.: Ao submeter o comando, 
#retire todos os espaço em branco. 

print("Q10. R): ")
mapply(rep, c("rural", "amo"), 10:1)


#Qual deve ser o código em print para que as seguintes sequências
#sejam impressas: 1:10, 2:11 e 3:12(ver abaixo a saída)? 
#OBS.: Ao submeter o código, retire todos os espaço 
#em branco e não use parênteses.

print("Q11. R): ")
for (i in 1:length(1:3)){
	for (j in 1:10)
	{
		print(j+i-1)
	}
}


#Crie o data frame 'student.df' com os dados fornecidos a seguir: 
#student.df = data.frame (nome= c ("Sue", "Eva", "Henry", "Jan"),
#sexo= c ("f", "f", "m", "m"), anos= c (21,15,17,19)). Use a função 
#"ifelse" para adicionar os elementos de uma nova coluna chamada de "menor".
# Essa coluna, que deve ser adicionada ao data frame, é uma coluna lógica, 
#indicando "V" se a observação for um homem ("m") com menos de 18 anos. 
#Caos contrário, atribua "F" (veja o resultado esperado abaixo). 
#Digite apenas uma linha de código correspondente a toda essa ação. 
#Note que você deve tirar todos os espaços em branco e a coluna "menor" 
#deve ser atribuída ao data frame através do operador "$". Além disso, as 
#colunas do data frame devem ser acessadas pelo nome e usem aspas duplas.

print("Q12. R): ")
nome <- c("Sue", "Eva", "Henry", "Jan")
sexo <- c ("f", "f", "m", "m")
anos <- c(21,15,17,19)
student.df <- data.frame (nome=nome, sexo=sexo, anos=anos)

student.df$menor <- ifelse(student.df[,"sexo"]== "m" & student.df[,"anos"]<18, "V", "F")
student.df


#Qual o comando usando a família apply você consegue obter
#a soma de cada um dos crimes contido no dataset USArrests
#(já incluído no R) com a saída igual a apresentada abaixo?
#OBS.: Ao submeter o código, retire todos os espaço em branco.

print("Q13. R): ")
lapply(USArrests, FUN=sum)


#Qual o resultado do código abaixo ?

print("Q14. R): ")
x = 0
a = 0
b = -5

if (a > 0){
	if (b < 0){
		x = x + 5
	}else if (a > 5){
		x = x + 4
	}else{
		x = x + 2
	}
	print("*****")
}else{
	x = x + 2
}

print(x)


#Qual a resposta correta ? 

print("Q15. R): ")
x = 0

while(x < 100){
	x = x + 2
}
print(x)