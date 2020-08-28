#Lista de Atividades 5

#Crie os vetores a seguir: ‘mouse.color' com os valores:
#‘purple’, ‘red’, ‘yellow’,‘brown’; ‘mouse.weight’ com 
#os valores 23, 21, 18, 26. Crie um data frame chamado 
#de ‘mouse.info’ com esses vetores, formando 4 linhas e 2 
#colunas. Nomeie a primeira coluna para ‘colour’ e a segunda
# para ‘weight’. De posse desse data frame, responda as 
#perguntas abaixo. OBS.: Ao submeter o comando, retire todos
#os espaço em branco. 

mouse.color <- c("purple", "red", "yellow", "brown")
mouse.weight <- c(23, 21, 18, 26)
mouse.info <- data.frame("colour"=mouse.color, "weight"=mouse.weight)


#Qual comando imprima a estrutura do data frame no console ? *
print("Q1. R): ")
str(mouse.info)


#Qual comando imprima apenas a linha 3 no console ? 

result <- mouse.info[3,]
print(c("Q2. R): ", result))


#Qual comando imprima apenas a coluna 1 no console ?

result <- mouse.info[,1]
print(c("Q3. R): ", result))


#Qual comando imprima o item na linha 4 da coluna 1 ?

result <- mouse.info[4, 1]
print(c("Q4. R): ", result))


#Para as questões abaixo use o dataset airquality já incluído no RStudio.

#Qual foi o valor mínimo de ozônio no mês de maio ?

maio <- airquality[airquality$Month==5,]
result <- min(maio$Ozone, na.rm=T)
print(c("Q5. R): ", result))

#Extraia o subconjunto do data frame em que os valores de Ozônio estão 
#acima de 25 e os valores da temperatura (Temp) estão abaixo de 90. 
#Qual é a média do Solar.R nesse subconjunto? 

ozone_filter <- airquality[with(airquality, Ozone > 25 & Temp < 90),]
result <- mean(ozone_filter$Solar.R, na.rm=T)
print(c("Q6. R): ", result))


#Qual a quantidade de casos completos no dataset airquality ? 
#Ou seja, a quantidade de observação (linhas) sem NAs.

new_airquality <- airquality[complete.cases(airquality),]
result <- nrow(new_airquality)
print(c("Q7. R): ", result))


#Carregue o arquivo genomes.csv numa variável
#chamada genomas através do seguinte comando: 
#genomas <- as.data.frame(read.csv(
#"https://www.dropbox.com/s/vgh6qk395ck86fp/genomes.csv?dl=1")).
#De posse desse dado, responda as perguntas abaixo. 

readline(prompt="Enter to continue: ")
genomas <- as.data.frame(read.csv("https://www.dropbox.com/s/vgh6qk395ck86fp/genomes.csv?dl=1"))


#Selecione os organismos com mais de 40 cromossomos. 

genomas_40chromosomes <- genomas[genomas$Chromosomes > 40,]
print(c("Q8. R): "))
print(levels(factor(genomas_40chromosomes$Organism)))


#Selecione os organismos que contém plasmídeos e também possui mais de um cromossomo. 

new_genomas <- genomas[with(genomas, Plasmids > 0 & Chromosomes > 1),]
print(c("Q9. R): "))
print(new_genomas$Organism)


#Quantos grupos diferentes existem?

ngroups <- length(levels(factor(genomas$Groups)))
print(c("Q10. R): "))
print(ngroups)


#Carregue o arquivo cancer_stats.csv numa variável chamada cancer_stats
#através do seguinte comando: cancer_stats <- as.data.frame(read.csv(
#"https://www.dropbox.com/s/g97bsxeuu0tajkj/cancer_stats.csv?dl=1")). 
#De posse desse dado, responda as perguntas abaixo. 

cancer_stats <- as.data.frame(read.csv("https://www.dropbox.com/s/g97bsxeuu0tajkj/cancer_stats.csv?dl=1"))


#Para qual local do câncer (site) do sistema digestivo 
#(Digestive System) existem mais casos femininos do que masculinos?

digestive <- cancer_stats[cancer_stats$Class == "Digestive System",]
digestive.female <- digestive[with(digestive, Female.Cases > Male.Cases),]
print(c("Q11 R): "))
print(digestive.female)


#Qual local do câncer tem a melhor taxa de sobrevivência para os homens? 

cancer_stats$Male.Death.Rate <- with(cancer_stats, Male.Deaths/Male.Cases) #calcula taxa
min_male <- min(cancer_stats$Male.Death.Rate, na.rm=T) #calcula taxa mínima
valid_stats <- cancer_stats[!is.na(cancer_stats$Male.Death.Rate),] #pega linhas válidas
min_male_site <- valid_stats[valid_stats$Male.Death.Rate==min_male,] #pega linha com taxa mínima
print(c("Q12 R): "))
print(min_male_site)


#Qual local de câncer tem a pior taxa de sobrevivência para as mulheres?

cancer_stats$Female.Death.Rate <- with(cancer_stats, Female.Deaths/Female.Cases) #calcula taxa
max_female <- max(cancer_stats$Female.Death.Rate, na.rm=T) #calcula taxa mínima
valid_stats <- cancer_stats[!is.na(cancer_stats$Female.Death.Rate),] #pega linhas válidas
max_female_site <- valid_stats[valid_stats$Female.Death.Rate==max_female,] #pega linha com taxa mínima

print(c("Q13 R): "))
print(max_female_site)
