# Lista de Atividades 10

#Instale e carregue o pacote dplyr. Em seguida use o 
#seguinte comando para carregar os dados que irá trabalhar:
#df=data.frame(Theoph). Note que Wt: é o peso do sujeito (kg);
#Dose: é a dose de teofilina administrada por via oral ao 
#indivíduo (mg / kg); Time: é o tempo desde a administração 
#do medicamento quando a amostra foi coletada (h); e conc: 
#é concentração de teofilina na amostra(mg / L). Responda as
#questões abaixo usando exclusivamente o pacote dplyr. 
#Note que ao submeter a resposta remova todos os espaços
#em branco. Também use um dos padrões a seguir: 
#filter(dataset,<<>>) ou dataset%>%filter(<<>>).

install.packages("dplyr")
library(dplyr)

df=data.frame(Theoph)


#Qual o comando seleciona apenas a coluna Dose de df ? *

print("Q3. R): ")
select(df,Dose)


#Qual o comando apresenta os dados para as doses maiores que 5 mg/kg ? *

print("Q4. R): ")
filter(df,Dose>5)


#Qual o comando seleciona as linhas de 10-20 ?Dica: use o "slice". *

print("Q5. R): ")
slice(df,10:20)


#Qual comando apresenta os dados para as doses maiores que 5 e cujo
#o tempo desde a administração do medicamento (Time) é maior que a 
#média do mesmo? Use apenas um único comando. *

print("Q6. R): ")
filter(df,Dose>5,Time>mean(Time))


#Qual comando organizar df por peso (decrescente) 

print("Q7. R): ")
arrange(df,desc(Wt))


#Qual comando organizar df por peso (crescente) e tempo (decrescente) ? *

print("Q8. R): ")
arrange(df,Wt,desc(Time))


#Qual comando cria uma nova coluna chamada "tendencia" que é igual à Time-mean(Time)? *

print("Q9. R): ")
mutate(df,tendencia=Time-mean(Time))


#Qual comando apresenta a maior concentração de teofilina ? Não use nenhum nome para a coluna resultante.

print("Q10. R): ")
arrange(df,desc(conc))$conc[1]
#select(filter(df, conc==max(conc)), conc)


#Para os exercícios abaixo, usaremos dois conjuntos de dados relacionados aos 
#tempos de atraso de vôos do Bureau of Transportation Statistics dos EUA 
#(X673598238_T_ONTIME_REPORTING e L_UNIQUE_CARRIERS.csv_). Para carregar os 
#dados é importante que vocês usem os seguintes argumentos: quote="\"", 
#sep = "," . Note que a extensão ".csv_" está correta. O data frame 
#do arquivo (X673598238_T_ONTIME_REPORTING)  possui apenas informações
#da companhia aérea por código. No entanto, queremos saber os nomes
#das companhias aéreas. Assim, faça o merge dos datasets 
#"X673598238_T_ONTIME_REPORTING" e "L_UNIQUE_CARRIERS.csv_" através das 
#colunas "OP_UNIQUE_CARRIER" e "Code". Em seguida, responda as questões abaixo.


reporting <- read.table(file="data/673598238_T_ONTIME_REPORTING.csv", header=TRUE, sep=",", quote="\"")

unique <- read.table(file="data/L_UNIQUE_CARRIERS.csv_", header=TRUE, sep=",",  quote="\"")

data <- merge(x=unique, y=reporting, by.x = "Code", by.y = "OP_UNIQUE_CARRIER")


#Qual companhia teve o maior atraso ? *

print("Q11. R): ")
max_delay_per_line = aggregate(formula=DEP_DELAY_NEW~Description, FUN=max, data=data)
arrange(max_delay_per_line, DEP_DELAY_NEW)


#Qual companhia atrasa mais na média ? * / Qual companhia atrasa menos na média ? *

print("Q12. R): ")
mean_delay_per_line = aggregate(formula=DEP_DELAY_NEW~Description, FUN=mean, data=data)
arrange(mean_delay_per_line, DEP_DELAY_NEW)


#Qual companhia teve a maior proporção de atrasos ? * [CANCELADA]


#Você está encarregado de analisar um conjunto de dados que contém
#casos de tuberculose (TB) relatados entre 1995 e 2013, ordenados 
#por país, idade e sexo. O recurso mais exclusivo desses dados é o
# seu sistema de codificação. As colunas de três a vinte e três 
#codificam quatro partes separadas de informações em seus nomes de
# coluna: (i) As três primeiras letras de cada coluna indicam se a
# coluna contém casos novos ou antigos de TB. (ii) As próximas duas
# letras descrevem os tipos de casos que estão sendo contados. (iii)
# A sexta letra descreve o sexo dos pacientes com tuberculose. 
#Os números restantes descrevem a faixa etária dos pacientes com TB.
# Carregue o conjunto de dados de http://stat405.had.co.nz/data/tb.csv
# como um novo dataframe chamado TB. Observe que o conjunto de dados 
#TB é desordenado de várias maneiras. Primeiramente, mova os valores 
#das colunas 3 até 23 para uma única coluna chamada de “Informacao”. 
#Dica use o gather (). Divida os conteúdos da variável “informacao” 
#em cada sublinhado(”_”). Dica use o separate () e chame as colunas 
#resultantes de "caso", "tipo” e "sexofaixa”. Por fim, divida a variável
#que contém o sexo e a faixa etária ("sexofaixa”) de modo a criar uma 
#coluna de "sexo" e uma coluna de "faixa". De posse do data frame 
#resultante, responda as questões abaixo.
install.packages("tidyr")
library(tidyr)

TB <- read.table(file="data/tb.csv", header=TRUE, sep=",")
TB <- gather(TB, key="informação", value="valor", 3:23)
TB <- separate(TB, col = "informação", into = c("caso", "tipo", "sexofaixa"), sep = "_")
TB <- separate(TB, col = "sexofaixa", into = c("sexo", "faixa"), sep=1)


#Qual foi a quantidade de casos para a Tailândia (TH) de pessoas do sexo Masculino? *

print("Q13. R): ")
aggregate(formula=valor~iso2, FUN=sum, data=TB[TB$sexo == "m",])
sum(TB[TB$sexo == "m" & TB$iso2=="TH",]$valor, na.rm=T)

#Qual a proporção de casos para os estados unidos (US) ? Não considerar valores NAs

print("Q14. R): ")
sum(TB[TB$iso2=="US",]$valor, na.rm=T)/sum(TB$valor, na.rm=T)
sum(select(filter(TB, iso2 == "US"),valor), na.rm=T) / sum(TB$valor, na.rm=T)
#[1] 0.00369587

#Qual a quantidade de casos para a faixa etária 2534 do sexo feminino? *

print("Q15. R): ")
sum(TB[TB$sexo == "f" & TB$faixa=="2534",]$valor, na.rm=T)


#Qual foi a quantidade de casos para a década de 2000 ? A década de 2000,
#também referida como anos 2000, compreende o período de tempo entre 1 de
#janeiro de 2000 e 31 de dezembro de 2009. *

print("Q16. R): ")
sum(TB[TB$year>=2000 & TB$year <= 2009,]$valor, na.rm=T)
