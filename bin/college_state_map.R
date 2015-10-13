library(ggplot2)
library(maps)

#scheme = c('#fde0dd','#fa9fb5', '#c51b8a')
#scheme = c('#deebf7', '#9ecae1','#3182bd')
#scheme = c('#ece7f2','#a6bddb', '#2b8cbe')
scheme = c('#edf8b1','#7fcdbb', '#2c7fb8')


#extract reference data
states_map <- map_data("state")
mydata <- read.csv('../proc_data/state_intern.csv')
names(mydata) <- c('region', 'Interns')
df <- merge(mydata, states, by='region')

w = ggplot(mydata, aes(map_id = region)) + geom_map(aes(fill = Interns), map=states_map, colour='white') + expand_limits(x = states_map$long, y = states_map$lat)
w <- w + scale_fill_gradient2(low = scheme[1], mid = scheme[2], midpoint=30, high = scheme[3], limits = c(0, 60)) 
w <- w + labs(x='', y='') + scale_x_continuous(breaks=NULL) + scale_y_continuous(breaks=NULL)
w <- w + theme_bw() + theme(panel.border = element_blank())

png('../figs/college_state_map.png', width=1200, height=800, res=150)
print(w)
dev.off()