library(ggplot2)
library(maps)

#sequential
#scheme = c('#fde0dd','#fa9fb5', '#c51b8a')
#scheme = c('#deebf7', '#9ecae1','#3182bd')
#scheme = c('#ece7f2','#a6bddb', '#2b8cbe')
#scheme = c('#edf8b1','#7fcdbb', '#2c7fb8')
#scheme = c('#edf8b1','#ffffff', '#2c7fb8')

#diverging
scheme = c('#ef8a62','#f7f7f7', '#67a9cf')
#scheme = c('#fc8d59','#ffffbf','#91bfdb')

#extract reference data
states_map <- map_data("state")
mydata <- read.csv('../proc_data/state_intern_fraction.csv')

colnames(mydata)[6] <- 'Intern_Representation'

w = ggplot(mydata, aes(map_id = State)) + geom_map(aes(fill = Intern_Representation), map=states_map, colour='white') + expand_limits(x = states_map$long, y = states_map$lat)
w <- w + scale_fill_gradient2(low = scheme[1], mid = scheme[2], midpoint=0, high = scheme[3], limits = c(-7,11), name="Intern\nRepresentation\nIndex") 
w <- w + labs(x='', y='') + scale_x_continuous(breaks=NULL) + scale_y_continuous(breaks=NULL)
w <- w + theme_bw() + theme(panel.border = element_blank())

#w <- w + guides(fill=guide_legend(title="New Legend Title"))
#w <- w + guides(fill=FALSE)
#w <- w + scale_fill_discrete(name="Experimental\nCondition")
    

png('../figs/college_state_map.png', width=1400, height=700, res=150)
print(w)
dev.off()