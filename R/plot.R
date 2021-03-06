
tostplot <- function(image, ggtheme = NULL, theme = NULL) {
  ciw <- 90

  data <- image$state

  plot <- ggplot(data=data, aes_string(x=0, y='m')) +
    geom_hline(yintercept=data$low,  colour=theme$color[1]) +
    geom_hline(yintercept=data$high, colour=theme$color[1]) +
    geom_text(aes(5, data$low,  vjust=-.9, hjust=1), label='Lower bound', colour=theme$color[1]) +
    geom_text(aes(5, data$high, vjust=1.9, hjust=1), label='Upper bound', colour=theme$color[1]) +
    geom_errorbar(aes_string(x=0, ymin='cil', ymax='ciu', width=.4), size=.8, colour=theme$color[1]) +
    geom_point(aes_string(x=0, y='m'), shape=21, fill=theme$fill[1], size=3, colour=theme$color[1]) +
    labs(x='', y='') +
    expand_limits(x=c(-2, 5), y=0) +
    ggtheme +
    theme(
      axis.text.x=element_blank(),
      axis.title.x=element_blank(),
      axis.ticks.x=element_blank(),
      axis.title.y=element_blank(),)

  suppressWarnings(print(plot))
}
