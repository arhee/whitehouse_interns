
library(ggplot2)
library(plyr)
cols = c('#CC6699', '#008AB8')

df <- read.csv('../proc_data/Interns_combined.csv')
df$Gender <- revalue(df$Gender, c('female'='Female', 'male'='Male'))
df$Season <- revalue(df$Season, c('summer'='Summer', 'spring'='Spring'))
df$Period <- paste(df$Year, df$Season)

df <- df[df$Gender != "?", ]

p = ggplot(df, aes(x=Period, fill=Gender)) + geom_bar(position='dodge') 
p <- p + scale_fill_manual(values = cols)
p <- p + ggtitle('Gender Composition of WH Interns by Period')


png('../figs/intern_gender_hist.png', width=1200, height=800, res=150)
print(p)
dev.off()

#shift Gender
#x = yera