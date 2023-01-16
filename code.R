##### Final work through
##### This takes two files, one of read and another list of reads and the length of the read and the lenght needed to make the read the same lenght as another dateset of read
##### I wrote a python program but using the R strtrim function is faster

library(stringr)


table1 <- read.table("/Users/scerbin/Desktop/Dvir-dysgenic-all.fasta.sorted.tbl.addtrim.1", sep = " ")
##View(table3)

table2 <- str_split_fixed(table1$V1, "\t", 2) #Reformat the column to make datatype compatable for strtrim
##View(table2)

table3 <- as.data.frame(table2) #works to put the list into a readable dataframe

table3$V3 <- table1$V3 #works add column with sequences and no read_id
##View(table4)

#####table3 <- subset (table3, select = -V4) # subset the column with the reads

table3$V4 <- strtrim(table3$V2,table3$V3) #This works to trim the reads

table4 <- subset (table3, select = c(-V2,-V3)) #clean up the final file so its easier to process in unix into a Fasta file

##View(table4)

write.table(table4, file = "Dvir-dysg3enic-all.fasta.sorted.tbl.trimed.1.txt", sep = "\t",
            row.names = TRUE, col.names = NA)
