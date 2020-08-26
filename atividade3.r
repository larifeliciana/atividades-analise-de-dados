#Lista de Atividades 3


#Vetores aceitam apenas um tipo de dados. O que acontece
#com xx com o seguinte comando: xx <- c(TRUE, 2)?

xx <- c(TRUE, 2)
paste0(c("Q4. R): ", xx))

#Suponha que você tenha um vetor x <- 1:4 e 
#y <- 2:3. O que é produzido pela expressão x * y?

x <- 1:4
y <- 2:3
result = x*y
paste0(c("Q6. R) : ", result))


#Dada a tabela no link abaixo que representa uma competição 
#entre Maria e Joana, determine quem foi a vencedora. Dica: primeiro
#padronize os dados e depois calcule a média dos valores padronizados. 
#https://docs.google.com/drawings/d/1_szurYna3gDzTB3ht9AQlWChbq_KLcCMPNJ22J1ydZI/edit?usp=sharing

media <- c(30, 155, 50, 1829, 75)
desvio <- c(6, 23, 8, 274, 12)
maria <- c(42, 102, 38, 2149, 97)
joana <- c(38, 173, 71, 1554, 70)
joana_score <- mean((joana - media)/desvio)
maria_score <- mean((maria - media)/desvio)

paste0("Q7. R) Joana: ", joana_score)
paste0("Maria: ", maria_score)


#Para responder as questões abaixo, faça download do arquivo disponível
#em https://www.dropbox.com/s/6t7b44acy7yfczu/vetor.RData?dl=1 e mova-o
#para o seu diretório. Em seguida leia-o com o comando load(“vetor.RData”).
#O vetor01 possui 15.000 observações referentes às notas dos candidatos do 
#concurso público para auxiliar administrativo da Prefeitura de São Longuinho. 
#Os dados foram disponibilizados pela empresa organizadora do concurso.
#As notas variam de 0 a 10 e os candidatos que não realizaram a prova estão
#com NA nos respectivos campos. De posse dos dados, responda as perguntas abaixo.

load("vetor.RData")


#Qual foi a média das notas ?

result <- mean(vetor01, na.rm=T)
paste0("Q8. R) : ", result)


#Qual foi a mediana das notas ?

result <- median(vetor01, na.rm=T)
paste0("Q9. R) : ", result)


#Qual o desvio padrão das notas ?

result <- sd(vetor01, na.rm=T)
paste0("Q10. R) : ", result)


#Qual foi a quantidade de faltosos ?

result <- length(vetor01[is.na(vetor01)])
paste0("Q11. R) : ", result)


#Qual foi percentual de faltosos ?

result <- length(vetor01[is.na(vetor01)]) / length(vetor01)
paste0("Q12. R) : ", result)


#Quantos candidatos obtiveram notas maiores do que 7.00 e menores do que 8.00 ?

result <- length(vetor01[vetor01 > 7 & vetor01 < 8 & !is.na(vetor01)])
paste0("Q13. R) : ", result)


#Quantos candidatos obtiveram notas maiores do que 9.00 ou menores do que 1.00?

result <- length(vetor01[(vetor01 > 9 | vetor01 < 1) & !is.na(vetor01)])
paste0("Q14. R) : ", result)