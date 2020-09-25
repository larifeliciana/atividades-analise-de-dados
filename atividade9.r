#Lista de Atividades 9


#Carregue o dataset do link abaixo. Esse dataset contém
#informações do peso do coração e corporal de 97 gatos 
#adultos que foram usados para experimentos com a droga
#"digitalis". Com posse desses dados responda as perguntas
# abaixo. Qual foi a média do peso dos gatos (Bwt) ? 
#https://www.dropbox.com/s/w4xv9urbowbig3s/catsM.csv?dl=0 *

data <- read.csv("data/catsM.csv")
result <- mean(data$Bwt)
print("Q3. R): ")
print(result)
#2.9


#Para as questões abaixo considere o dataset 
#"Caracol_data_checked.csv". Note que para 
#você obter esse dataset você precisa executar
#todos os passos apresentado na aula de Manipulação Básica.

Caracol_data<-read.csv(file="data/Snail_feeding.csv",
					   header=T,
					   strip.white= T,
					   na.strings= "")



Caracol_data <- Caracol_data[, 1:7]

str(Caracol_data)

levels(Caracol_data$Sex)[2] <- "female"
levels(Caracol_data$Sex)[3] <- "male"
levels(Caracol_data$Sex)[3] <- "male"


Caracol_data$Distance<-as.character(Caracol_data$Distance)
Caracol_data$Distance<-as.numeric(Caracol_data$Distance)
which(is.na(Caracol_data$Distance))

Caracol_data[682,"Distance"] <-0.58
Caracol_data[755,"Distance"]<-0.356452

index <-which(duplicated(Caracol_data))
Caracol_data<-Caracol_data[-index, ]

Caracol_data[which(Caracol_data$Depth> 2), ]
Caracol_data[8,6] <-1.62


#Qual a média da profundidade (depth) dos caracóis marinhos? 

print("Q4. R): ")
print(mean(Caracol_data$depth))


#Qual foi a maior distância coletada para o Caracol Marinho Pequeno e Feminino ? *

female_small <- Caracol_data[with(Caracol_data, Size=="small" & Sex=="female"),]
print("Q5. R): ")
print(max(female_small$Distance, na.rm=T))


#Para as questões abaixo carregue os dados do dataset Sparrows.csv.

#O arquivo de dados Sparrows.csv contém medidas de asa, tarso, 
#cabeça e bico de duas espécies de pardal. Use 
#read.table(file <- "Sparrows.csv", header <- TRUE) para carregar
# os dados para um objeto chamado Sparrows. Depois, use a função
# View () para exibir os dados. Note que algo deu errado! 
#Todas as variáveis foram combinadas em uma grande coluna. 
#Qual foi o problema ? *

print("Q6. R): ")
Sparrows <- read.table(file="data/Sparrows.csv", header=TRUE, sep=",")
#View(Sparrows)
#precisa do separator ","


#Qual o tamanho mínimo e máximo da cabeça da especie "SSTS" ? *

ssts <- Sparrows[Sparrows$Species == "SSTS",]

print("Q7. R): ")
min(ssts$Head) #29.2
max(ssts$Head) #33.5


#Durante a entrada de dados, três linhas foram inseridas
#duas vezes. Quais são essas linhas duplicadas?

print("Q8. R): ")
print(which(duplicated(Sparrows)))
#[1]  23  37 140


#Exiba os níveis do fator Sex. Veja que os níveis estão bagunçados.
#Altere de modo que a variável sexo contenha apenas os níveis "Male"
# e "Female". Por exemplo, "Femal" deve ser "Female". Após isso,
# determine qual é a media do tarso dos pardais femininos e masculinos. *


levels(Sparrows$Sex)[1] <- "Female"
levels(Sparrows$Sex)[2] <- "Female"
levels(Sparrows$Sex)[3] <- "Male"


female <- Sparrows[Sparrows$Sex == "Female",]
male <- Sparrows[Sparrows$Sex == "Male",]

print("Q9. R): ")
print(mean(female$Tarsus)) #21.12007
print(mean(male$Tarsus)) #21.62668


#Digite o comando que verifica quais linhas na variável Wing contém NAs.
#Use a função which. OBS.: Remova todos os espaços em branco. *

print("Q10. R): ")
print(which(is.na(Sparrows$Wing)))


#Substitua todos os NAs da questão anterior pelos valores 59, 56.5 e 57
#(nessa ordem). Qual a média das asas dos pardais ? 

Sparrows$Wing[64] <- 59
Sparrows$Wing[250] <- 56.5
Sparrows$Wing[806] <- 57

print("Q11. R): ")
print(mean(Sparrows$Wing)) #57.86205


#Qual o comando ordena o data frame pelas colunas Wing e Head e crie um novo 
#objeto chamado de Sparrows_Ordenado ? *

print("Q12. R): ")
Sparrows_Ordenado<-Sparrows[order(Sparrows$Wing,Sparrows$Head),]
