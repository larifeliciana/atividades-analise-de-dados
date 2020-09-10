#Lista de Atividades 7

#Qual o resultado da função abaixo. 

y <- 5

mult <- function(x, y){
	return(x*y)
}

print("Q3. R): ")
mult(10) #Erro


#Qual o resultado da função abaixo. 

y <- 5

mult <- function(x){
	return(x*y)
}

print("Q4. R): ")
mult(10) #50


#Escreva uma função chamada 'prisoes' que calcula a soma
#das prisões em estados americanos do dataset USArrests. 
#A função 'prisoes' recebe dois argumentos: 'estados' e 
#'tiposPrisoes'. Dado esses argumentos, a função retorna
# o total de prisões. Se não existir nem o estado ou o 
#tipo de prisão, então uma mensagem de erro deve ser 
#retornada. O protótipo dessa função é: 
#prisoes <- function(estados, tiposPrisoes){}. 
#As seguintes mensagens precisam ser apresentadas caso
# o estado ou o tipo de prisão estejam inválidos: 
#"Estado Inválido" ou "Tipo de Prisão Inválida". 
#De posse dessa função, responda as questões abaixo.

prisoes <- function(estados, tiposPrisoes){
	estados.validos = all(estados %in% rownames(USArrests))
	tiposPrisoes.validos = all(tiposPrisoes %in% colnames(USArrests))

	if (estados.validos){

		if (tiposPrisoes.validos){
		
			string_output <- ifelse(length(estados) > 1,
									"O total de prisoes dos estados ",
									"O total de prisoes dos estados ")
			
			total <- sum(USArrests[estados, tiposPrisoes])
			paste(string_output, toString(estados), "é", total)
		}else{
			print("Tipo de Prisão Inválida")
		}
	}
	else{
		print("Estado Inválido")
	}


}


#Qual é o total de prisões do código a seguir? 
#prisoes(estados="Tennessee", tiposPrisoes=c("Rape","Murder"))

print("Q5. R): ")
prisoes(estados="Tennessee", tiposPrisoes=c("Rape","Murder"))


#Qual é o total de prisões do código a seguir? 
#prisoes(estados=c("California ","Miami", "Arizona"), tiposPrisoes=("Assault")) 

print("Q6. R): ")
prisoes(estados=c("California ","Miami", "Arizona"), tiposPrisoes=("Assault")) 


#Qual é o total de prisões do código a seguir? 
#prisoes(estados=c("Pennsylvania","Mississippi", "Nebraska"), tiposPrisoes=c("Rape","UrbanPop","Assault"))

print("Q7. R): ")
prisoes(estados=c("Pennsylvania","Mississippi", "Nebraska"), tiposPrisoes=c("Rape","UrbanPop","Assault"))


#Qual é o total de prisões do código a seguir? 
#prisoes(estados=c("Vermont","Wisconsin", "Texas"), tiposPrisoes=c("Rape","Assalto"))

print("Q8. R): ")
prisoes(estados=c("Vermont","Wisconsin", "Texas"), tiposPrisoes=c("Rape","Assalto")) 


#Para responder as questões abaixo ver o documento " Detalhamento de Questões".
#rsMais especificamente, Questão 'minhasNotas_1'.

nas <- function(variable){
	variable[is.na(variable)] <- 0
	return (variable)
}

VA1 <- function(Exe_1, VA_1){
	return (mean(nas(Exe_1)) * 0.5 + (mean(nas(VA_1)) * 0.5))
}

VA2 <- function(Exe_2, Proj, VA_2){
	return (mean(nas(Exe_2) * 0.2)  + mean(nas(Proj) * 0.5) + (mean(nas(VA_2)) * 0.3))
}

minhasNotas_1 <- function(Exe_1=0, VA_1=0, Exe_2=0, Proj=0,
						  VA_2=0, VA_3=0, Opt=1, threshold=7){

	#retorna a média do aluno de acordo com a opção escolhida 
	#e também se a mesma está abaixo ou a cima do "threshold

	#"Opt": 1 para retornar a média da 1 VA
	#     	2 para retornar a média da 2 VA
	# 		3 para retornar a Média Final, incluindo a 3 VA
	#"threshold" consiste da média mínima de aprovação. 

	# Pesos das notas:
	# 'Exe_1': 5, "VA_1":5, "Exe_2": 2, "Proj": 5 e "VA_2": 3
	#
	todas_notas = nas(c(Exe_1, VA_1, Exe_2, Proj, VA_2, VA_3))

	if (any(todas_notas > 10 | todas_notas < 0)){
		return("Nota Inválida")

	}
	if (Opt == 1){
		if (all(is.na(c(Exe_1, VA_1)))){
			print("Quantidade de Notas Inválida")
		}else{
			nota = VA1(Exe_1, VA_1)
			output = ifelse(nota >= threshold, " Acima da Média", " Abaixo da Média" )
			paste("Média 1ª VA: ", nota, output)

		}
	}else if (Opt == 2){

		if (all(is.na(c(Exe_2, Proj, VA_2)))){
			print("Quantidade de Notas Inválida")
		}else{
			nota = VA2(Exe_2, Proj, VA_2)
			output = ifelse(nota >= threshold, " Acima da Média", " Abaixo da Média")
			paste("Média 2ª VA: ", nota, output)
		}
	}else if(Opt == 3){
		notas = c(VA1(Exe_1, VA_1), VA2(Exe_2, Proj, VA_2), VA_3)
		notaFinal = mean(notas[notas > min(notas)])
		output = ifelse(notaFinal >= threshold, "Aprovado", "Reprovado" )
		paste(notaFinal, "--", output)
		

	}

	}

#Qual o retorno da seguinte função?	

print("Q9. R): ")
minhasNotas_1(Exe_1=c(10,9,7,1,11,10), VA_1=8, Exe_2=7, Proj=7, VA_2=7, VA_3=10, Opt=1, threshold=7)

print("Q10. R): ")
minhasNotas_1(Exe_1=c(10,9,5,1,5,10), VA_1=8, Exe_2=7, Proj=7, VA_2=7, VA_3=10, Opt=1, threshold=7) 

print("Q11. R): ")
minhasNotas_1(Exe_1=NA, VA_1=8, Exe_2=c(10,1,5), Proj=10, VA_2=8, VA_3=10, Opt=2, threshold=8) 

print("Q12. R): ")
minhasNotas_1(Exe_1=c(10,9,7,1,NA,NA), VA_1=NA, Exe_2=7, Proj=7, VA_2=7, VA_3=10, Opt=1, threshold=7) 

print("Q13. R): ")
minhasNotas_1(Exe_1=NA, VA_1=8, Exe_2=NA, Proj=10, VA_2=8, VA_3=10, Opt=2, threshold=8)

print("Q14. R): ")
minhasNotas_1(Exe_1=c(5,8), VA_1=8, Exe_2=c(10,1,5), Proj=10, VA_2=8, VA_3=2, Opt=3, threshold=8)

print("Q15. R): ")
minhasNotas_1(Exe_1=NA, VA_1=8, Exe_2=c(10,1,5), Proj=10, VA_2=8, VA_3=10, Opt=3, threshold=8) 

print("Q16. R): ")
minhasNotas_1(Exe_1=c(5,8), VA_1=8, Exe_2=c(10,1,5), Proj=c(2,4), VA_2=8, VA_3=2, Opt=3, threshold=8)

print("Q17. R): ")
minhasNotas_1(Exe_1=10, VA_1=NA, Exe_2=7, Proj=7, VA_2=7, VA_3=10, Opt=1, threshold=7) 



notaNumericaParaLetra <- function(number){
	if (number >= 9){
		return("A")
	}else if(number >= 7.5){
		return("B")
	}else if(number >= 6){
		return("C")
	}
	else if(number >= 0){
		return("D")
	}
}

minhasNotas_2 <- function(Exe_1=0, VA_1=0, Exe_2=0, Proj=0, 
						  VA_2=0, VA_3=0, Opt=1,threshold="C"){

	#retorna a média do aluno de acordo com a opção escolhida 
	#e também se a mesma está abaixo ou a cima do "threshold

	#"Opt": 1 para retornar a média da 1 VA
	#     	2 para retornar a média da 2 VA
	# 		3 para retornar a Média Final, incluindo a 3 VA
	#"threshold" consiste da média mínima de aprovação. 

	# Pesos das notas:
	# 'Exe_1': 5, "VA_1":5, "Exe_2": 2, "Proj": 5 e "VA_2": 3
	# Considere o seguinte racional para as notas: 
	# “A”( Excelente) de 9,0 até 10,0;
	# “B” (Bom) de 7,5 até 8,9;
	# “C” (Regular) de 6,0 até 7,4;
	# “D”( Reprovado) de 0,0 até 5,9. 
	todas_notas = nas(c(Exe_1, VA_1, Exe_2, Proj, VA_2, VA_3))

	if (any(todas_notas > 10 | todas_notas < 0)){
		return("Nota Inválida")

	}
	if (Opt == 1){
		if (all(is.na(c(Exe_1, VA_1)))){
			print("Quantidade de Notas Inválida")
		}else{
			nota = notaNumericaParaLetra(VA1(Exe_1, VA_1))
			output = ifelse(nota <= threshold, " Acima da Média", " Abaixo da Média" )
			paste("Média 1ª VA: ", nota, output)

		}
	}else if (Opt == 2){

		if (all(is.na(c(Exe_2, Proj, VA_2)))){
			print("Quantidade de Notas Inválida")
		}else{
			nota = notaNumericaParaLetra(VA2(Exe_2, Proj, VA_2))
			output = ifelse(nota <= threshold, " Acima da Média", " Abaixo da Média" )
			paste("Média 2ª VA: ", nota, output)
		}
	}else if(Opt == 3){
		notas = c(VA1(Exe_1, VA_1), VA2(Exe_2, Proj, VA_2), VA_3)
		notaFinal = notaNumericaParaLetra(mean(notas[notas > min(notas)]))
		output = ifelse(notaFinal <= threshold, "Aprovado", "Reprovado" )
		paste(notaFinal, "--", output)
		

	}

	}
	

#Qual o retorno da seguinte função?

print("Q18. R): ")
minhasNotas_2(Exe_1=c(8,9,NA), VA_1=5, Exe_2=9, Proj=5, VA_2=4, VA_3=1, Opt=1, threshold="C")

print("Q19. R): ")
minhasNotas_2(Exe_1=c(8,9,10,9,9,8,6), VA_1=4, Exe_2=c(8,3,11,9,9,5), Proj=4, VA_2=4, VA_3=1, Opt=1, threshold="C")

print("Q20. R): ")
minhasNotas_2(Exe_1=c(8,9,10,9,9,8,6), VA_1=7, Exe_2=c(8,3,10,9,9,5), Proj=8, VA_2=3, VA_3=1, Opt=3, threshold="B")

print("Q21. R): ")
minhasNotas_2(Exe_1=c(8,9,10,9,9,8,6), VA_1=7, Exe_2=c(8,3,10,9,9,5), Proj=8, VA_2=8, VA_3=1, Opt=2, threshold="B")

print("Q22. R): ")
minhasNotas_2(Exe_1=c(8,9,10,9,9,8,6), VA_1=7, Exe_2=c(8,3,10,9,9,5), Proj=5, VA_2=5, VA_3=10, Opt=4, threshold="B") 