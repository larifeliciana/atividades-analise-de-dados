#Lista de Atividades 4

#Um fator também pode ser gerado usando a função gl(). Qual o
#comando cria um fator com 100 repetições tanto para"M" quanto para "F" ?
#Note que o comando deve ser submetido no seguinte formato: gl(x,k,labels = z).
#OBS.: Ao submeter o comando, retire todos os espaço em branco. 

result <- gl(2,100,labels=c("M","F"))
print("Q3. R): ")
print(result)


#Crie o fator drinks <- factor(c("beer","beer","wine","water")). 
#Depois, submeta apenas o comando em R para calcular a proporção
#de cervejas (beer) no objeto fator de bebidas (drinks). É 
#obrigatório o uso da função mean para calcular a proporção. 
#OBS.: Ao submeter o comando, retire todos os espaço em branco. 

drinks <- factor(c("beer","beer","wine","water"))
result <- mean(drinks=="beer")
print(c("Q4. R): ", result))

#Crie o fator drinks <- factor(c("beer","beer","wine","water")).
#Depois, altere o primeiro nível do fator com o seguinte comando:
#levels(drinks)[1] <- "water". Qual o fator resultante quando 
#acessar os elementos do mesmo?

levels(drinks)[1] <- "water"
print("Q5. R): ")
print(drinks)


#Considere os vetores: nomes=[João, Paula, Maria, Ingrid, José, Marcos],
#pesos=[80, 65, 70, 58, 78, 70] e alturas=[1.70, 1.66, 1.65, 1.60, 1.76, 1.70]. 
#Crie uma lista com esses vetores chamada de lista_pessoas. 
#Depois, crie um quarto objeto chamado IMC de acordo coma equação IMC=pesos/alturas^2.
#Por fim, adicione o vetor IMC a lista_pessoas (ao final da lista) e responda as questões abaixo:

nomes <- c("João", "Paula", "Maria", "Ingrid", "José", "Marcos")
peso <- c(80, 65, 70, 58, 78, 70)
alturas <- c(1.70, 1.66, 1.65, 1.60, 1.76, 1.70)
lista_pessoas <- list(nomes=nomes, pesos=peso, alturas=alturas)
lista_pessoas$IMC <- lista_pessoas$pesos/lista_pessoas$alturas^2


#Qual o comando para acessar o primeiro nome contido no primeiro elemento da lista 
#(lista_pessoas)? OBS.: Ao submeter o comando, retire todos os espaço em branco. 

result <- lista_pessoas[[1]][1]
print(c("Q6. R): ", result))


#Quais são as classes dos objetos na lista?

print("Q7. R): ")
result <- str(lista_pessoas)


#O que retorna o seguinte comando lista_pessoas[[4]][3]?

result <- lista_pessoas[[4]][3]
print(c("Q8. R): ", result))


#A partir do dateset ‘airquality’, crie uma variável ‘lista’
#com o seguinte comando: lista<-lapply(airquality, 
#function(x){mean(x)}). A função lapply() retorna um objeto 
#do tipo lista com os valores das médias de cada uma das colunas
# do dataset ‘airquality’. Usando o RStudio, análise o dataset 
#'airquality' e a variável ‘lista’. Em seguida, escreva o comando
#que apenas apresenta a média das temperaturas contida na variável ‘lista’ . 

lista<-lapply(airquality, function(x){mean(x)})
print(c("Q9. R): ", lista$Temp))


#Para responder as questão abaixo, faça download do arquivo disponível
#em https://www.dropbox.com/s/luxinhu8d1hmc1j/chuvas.RData?dl=1 e mova-
#para o seu diretório. Em seguida leia-o com o comando load("chuvas.RData").
#A matriz chuvas possui dados (em mm) sobre precipitações em 100 municípios
#do Brasil, durante um período de 30 dias. Os municípios estão representados
# em códigos através das linhas e os dias através das colunas. Diante de 
#tais dados,resolva as questões abaixo.

load("chuvas.RData")


#Qual a média do volume diário de chuvas do período observado?

result <- mean(chuvas)
print(c("Q10. R): ", result))


#Qual município teve o maior volume de chuvas considerando os 30 dias observados?

soma_mun <- rowSums(chuvas)
maximo <- max(soma_mun)
result <- soma_mun[soma_mun==maximo]
print(c("Q11. R): ", result))


#Considerando o volume de todos os municípios observados, em qual dia menos choveu?

soma_dias <- colSums(chuvas)
minimo <- min(soma_dias)
result <- soma_dias[soma_dias==minimo]
print(c("Q12. R): ", result))


#Quais comandos abaixo calculam o volume de chuvas do 
#município 81 (mun_81) nos primeiros 10 dias observados?

print("Q13. R): ")

aux<-chuvas["mun_81" , ];
aux<-sum(aux[1:10])
print(aux)

aux<-chuvas[81 , ]; 
aux<-sum(aux[1:10])
print(aux)

aux<-chuvas[81 , ]; 
aux<-sum(aux[seq(1,10,1)])
print(aux)

aux<-chuvas["mun_81" ]; 
aux<-sum(aux[1:10])
print(aux)

aux<-chuvas["mun_81" , ]; 
aux<-sum(aux[c(1:10)])
print(aux)
