#Lista de Atividades 8

#Dado o vetor com valores de medidas de comprimento 
#em metros v<-c(20,30,4,934,1077,22), submeta a 
#função paste() que apenas adiciona a unidade metro (‘m’)
#após cada número do vetor. Note que não pode haver espaço
#entre o número e a unidade de medida. Além disso, use aspas
#simples e remova todos os espaços em banco do comando. *

print("Q3. R): ")
v<-c(20,30,4,934,1077,22)
paste(v,rep('m',length(v)), sep='')

#saída - > [1] "20m"   "30m"   "4m"    "934m"  "1077m" "22m"

#Copie o poema "No Meio do Caminho" de Drummond através do link:
#https://www.culturagenial.com/poema-no-meio-do-caminho-de-carlos-drummond-de-andrade/
# Note que tem que ser copiado e colado exatamente como está no site.
#Calcule e submeta a quantidade de caracteres totais, incluindo os 
#espaços em branco e as quebras de linha(‘\n’).

poema <- "No meio do caminho tinha uma pedra
tinha uma pedra no meio do caminho
tinha uma pedra
no meio do caminho tinha uma pedra.

Nunca me esquecerei desse acontecimento
na vida de minhas retinas tão fatigadas.
Nunca me esquecerei que no meio do caminho
tinha uma pedra
tinha uma pedra no meio do caminho
no meio do caminho tinha uma pedra."

print("Q4. R): ")
print(nchar(poema))

#333

#Dado o vetor de strings txt = c("eeer","3ca1n","fg","can","man","sigmean","fa3nta","fan"),
#submeta a expressão regular que deve ser escrita no atributo ‘pattern’
#da função grep(pattern= " ", txt, value= TRUE) de modo que ela retorne
#as palavras: "can", "man" e "fan". 

print("Q5. R): ")
txt = c("eeer","3ca1n","fg","can","man","sigmean","fa3nta","fan")
grep(pattern= "^\\wan", txt, value= TRUE)


#Dado a string txt = "eeer3GHJca1nfgSigmanfaUIOntafan", qual a expressão regular que 
#deve ser adicionada no atributo ‘pattern’ da função str_extract_all(string=txt,pattern=" "),
# para que ela extraia apenas números e letras maiúsculas. Note que você precisa carregar
# o pacote stringr. Também use o Regex.

print("Q6. R): ")
library(stringr)
txt <- "eeer3GHJca1nfgSigmanfaUIOntafan"
result<- str_extract_all(string=txt,pattern="[A-Z0-9]")
print(result)


#Responda a questão anterior com o POSIX. 

print("Q7. R): ")
result <- str_extract_all(string=txt,pattern="[[:upper:]+[:digit:]]")
print(result)

#Dado a string txt = "tttyUFRPE20PPGIAkjgkjghk2j34j321UFRPEcapdPPGIA", 
#qual a expressão regular que deve ser adicionado no atributo ‘pattern’
# da função str_extract_all(string=txt,pattern=" "), para que ela 
#extraia os padrões "UFRPE19PPGIA" e "UFRPEcapdPPGIA".

print("Q8. R): ")
txt <- "tttyUFRPE20PPGIAkjgkjghk2j34j321UFRPEcapdPPGIA"
result <- str_extract_all(string=txt,pattern="UFRPE(.*?)PPGIA")
print(result)

#Copie o discurso de Marthin Luther King Jr. do seguinte link: 
#http://www.dhnet.org.br/desejos/sonhos/dream.htm. Qual a expressão
#regular trás "negro", "negros", "Negro", "Negros", "negra" e "negras"?

print("Q9. R): ")
discurso <- "Eu estou contente em unir-me com vocês no dia que entrará para a história como a maior 
demonstração pela liberdade na história de nossa nação. Cem anos atrás, um grande americano, na qual
estamos sob sua simbólica sombra, assinou a Proclamação de Emancipação. Esse importante decreto veio
como um grande farol de esperança para milhões de escravos negros que tinham murchados nas chamas 
da injustiça. Ele veio como uma alvorada para terminar a longa noite de seus cativeiros.
Mas cem anos depois, o Negro ainda não é livre..."

result <- str_extract_all(string=discurso,pattern="[nN]egr[oa]s?")
print(result)


#Qual das opções abaixo correspondem a regexp "a(ab)*a" ?

print("Q10. R): ")
pattern <- "a(ab)*a"
paste("EPRESSÃO:", pattern)
strings <- c("abababa", "aaba", "aabbaa", "aba",  "aabababa")

for (string in strings){
	cat(string, " : ")
	print(grep(pattern=pattern, string, value= TRUE))
}


#Qual das opções abaixo correspondem a regexp "ab+c?" ? 

print("Q11. R): ")
pattern <- "ab+c?"
paste("EPRESSÃO:", pattern)
strings <- c("abc","ac","abbb","bbc")

for (string in strings){
	cat(string, " : ")
	print(grep(pattern=pattern, string, value= TRUE))
}


#Qual das opções abaixo correspondem a regexp "a.[bc]+" ? 

print("Q12. R): ")
pattern <- "a.[bc]+"
paste("EPRESSÃO:", pattern)
strings <- c("abc", "abbbbbbbb", "azc", "abcbcbcbc", "ac", "asccbbbbcbcccc")

for (string in strings){
	cat(string, " : ")
	print(grep(pattern=pattern, string, value= TRUE))
}

#Qual das opções abaixo correspondem a regexp "abc|xyz" ? 

print("Q13. R): ")
pattern <- "abc|xyz"
paste("EPRESSÃO:", pattern)
strings <- c("abc", "xyz", "abc|xyz")

for (string in strings){
	cat(string, " : ")
	print(grep(pattern=pattern, string, value= TRUE))
}


#Qual das opções abaixo correspondem a regexp "[a-z]+[\.\?!]" ? 

print("Q14. R): ")
pattern <- "[a-z]+[\\.\\?!]"
paste("EPRESSÃO:", pattern)
strings <- c("battle!", "Hot", "green", "swamping.", "jump up.", "undulate?", "is.?")

for (string in strings){
	cat(string, " : ")
	print(grep(pattern=pattern, string, value= TRUE))
}


#Qual das opções abaixo correspondem a regexp "[a-zA-Z]*[^,]=" ? 

print("Q15. R): ")
pattern <- "[a-zA-Z]*[^,]="
paste("EPRESSÃO:", pattern)
strings <- c("Butt=", "BotHEr,=", "Ample", "FIdDlE7h=", "Brittle =", "Other.=")

for (string in strings){
	cat(string, " : ")
	print(grep(pattern=pattern, string, value= TRUE))
}


#Qual das opções abaixo correspondem a regexp "[a-z][\.\?!]\s+[A-Z]"  ? 

print("Q16. R): ")
pattern <- "[a-z][\\.\\?!]\\s+[A-Z]"
paste("EPRESSÃO:", pattern)
strings <- c("A. B", "c! d", "e f", "g. H", "i? J", "k L")

for (string in strings){
	cat(string, " : ")
	print(grep(pattern=pattern, string, value= TRUE))
}


#Qual das opções abaixo correspondem a regexp "(very )+(fat )?(tall|ugly) man" ? 

print("Q17. R): ")
pattern <- "(very )+(fat )?(tall|ugly) man"
paste("EPRESSÃO:", pattern)
strings <- c("very fat man", "fat tall man", "very very fat ugly man", "very very very tall man")

for (string in strings){
	cat(string, " : ")
	print(grep(pattern=pattern, string, value= TRUE))
}


#Qual das opções abaixo correspondem a regexp "<[^>]+>"? 

print("Q18. R): ")
pattern <- "<[^>]+>" 
paste("EPRESSÃO:", pattern)
strings <- c("<an xml tag>", "<opentag> <closetag>", "</closetag>", "<>", "<with attribute=”77”>")

for (string in strings){
	cat(string, " : ")
	print(grep(pattern=pattern, string, value= TRUE))
}


#Baixe o dataset Gapminder através do seguinte comando: 
#aux<-read.table("https://www.dropbox.com/s/4yr2woj8r1p5sbn/gapminderDataFiveYear.txt?dl=1",
#header=TRUE, fill = TRUE). Após isso, responda as questões a seguir.

aux <- read.delim("https://www.dropbox.com/s/4yr2woj8r1p5sbn/gapminderDataFiveYear.txt?dl=1")

#Usando quantificadores, encontre todos os países com ee, mas
#não com eee, em seu nome. Abaixo, digite a expressão regular. 

print("Q19. R): ")
grep("e{2}", aux$country, value = TRUE)


#Encontre os nomes de países que: (i) começam com “Ba”; (ii) terminam com “land”; 
#e (iii) tenham uma palavra no nome que começa com “Ga” (dica: veja \b). 
#Após isso, submeta o total de países encontrados para os itens anteriores. *

print("Q20. R): ")
grep("(^Ba)|(land$)|(\\bGa)", levels(factor(aux$country)), value=T)

