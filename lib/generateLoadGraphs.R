# This function gets a dataframe with the eyetracking metrics and load indices, and the sessions to be drawn
# It returns the ggplot objects to be printed
plotLoadGraphs <- function(sessions, loaddata){
    
    window <- 10
    slide <- 5
    
    graphs <- list()
    i <- 0
    for(session in sessions){
        
        totaldata <- loaddata[loaddata$Session == session,]
        
        # We calculate the median of the values for the session
        meanPDmedian <- median(totaldata$value.Mean)
        sdPDmedian <- median(totaldata$value.SD)
        longFixMedian <- median(totaldata$value.Fix)
        sacSpMedian <- median(totaldata$value.Sac)
        
        p1 <- ggplot(totaldata, aes(x=time, y=value.Mean)) + 
            ggtitle(paste("Pupil diameter MEAN over ",window,"s",sep="")) + 
            geom_line() + geom_hline(yintercept=meanPDmedian) +
            #theme(axis.text.x = element_blank(),plot.title=element_text(size=20),axis.title=element_text(size=18))
            theme(axis.text.x = element_blank())
        
        p2 <- ggplot(totaldata, aes(x=time, y=value.SD)) + 
            ggtitle(paste("Pupil diameter SD over ",window,"s",sep="")) + 
            geom_line() + geom_hline(yintercept=sdPDmedian) +
            #theme(axis.text.x = element_blank(),plot.title=element_text(size=20),axis.title=element_text(size=18))
            theme(axis.text.x = element_blank())
        
        p3 <- ggplot(totaldata, aes(x=time, y=value.Fix)) + 
            ggtitle(paste("Fixations >500ms over ",window,"s",sep="")) + 
            geom_line() + geom_hline(yintercept=longFixMedian) +
            #theme(axis.text.x = element_blank(),plot.title=element_text(size=20),axis.title=element_text(size=18))
            theme(axis.text.x = element_blank())
        
        p4 <- ggplot(totaldata, aes(x=time, y=value.Sac)) + 
            ggtitle(paste("Saccade speed over ",window,"s",sep="")) + 
            geom_line() + geom_hline(yintercept=sacSpMedian) + ylim(0,1)
            #theme(axis.text.x = element_blank(),plot.title=element_text(size=20),axis.title=element_text(size=18))
            theme(axis.text.x = element_blank())
        
        p5 <- ggplot(totaldata, aes(x=time, y=Load, col=Load)) + 
            ggtitle(paste("Load Index\n(estimation of cognitive overload over ",window,"s)\n",session,sep="")) + 
            geom_line(size=1) + stat_smooth(method="loess",span=0.1) +
            #theme(axis.text.x = element_text(size=18),plot.title=element_text(size=20, face="bold"),axis.title=element_text(size=18),panel.background = element_rect(fill = 'white')) +
            theme(panel.background = element_rect(fill = 'white')) +
            scale_color_gradient(low="green",high="red")
        
        # We add the objects to the list of graphs to be returned (and enventually printed)
        graphs[[i*5 + 1]] <- p1
        graphs[[i*5 + 2]] <- p2
        graphs[[i*5 + 3]] <- p3
        graphs[[i*5 + 4]] <- p4
        graphs[[i*5 + 5]] <- p5
        i <- i+1
    }
    
    graphs
    
}

# Multiple plot function, from http://www.cookbook-r.com/Graphs/Multiple_graphs_on_one_page_(ggplot2)/
#
# ggplot objects can be passed in ..., or to plotlist (as a list of ggplot objects)
# - cols:   Number of columns in layout
# - layout: A matrix specifying the layout. If present, 'cols' is ignored.
#
# If the layout is something like matrix(c(1,2,3,3), nrow=2, byrow=TRUE),
# then plot 1 will go in the upper left, 2 will go in the upper right, and
# 3 will go all the way across the bottom.
#
multiplot <- function(..., plotlist=NULL, file, cols=1, layout=NULL) {
    require(grid)
    
    # Make a list from the ... arguments and plotlist
    plots <- c(list(...), plotlist)
    
    numPlots = length(plots)
    
    # If layout is NULL, then use 'cols' to determine layout
    if (is.null(layout)) {
        # Make the panel
        # ncol: Number of columns of plots
        # nrow: Number of rows needed, calculated from # of cols
        layout <- matrix(seq(1, cols * ceiling(numPlots/cols)),
                         ncol = cols, nrow = ceiling(numPlots/cols))
    }
    
    if (numPlots==1) {
        print(plots[[1]])
        
    } else {
        # Set up the page
        grid.newpage()
        pushViewport(viewport(layout = grid.layout(nrow(layout), ncol(layout))))
        
        # Make each plot, in the correct location
        for (i in 1:numPlots) {
            # Get the i,j matrix positions of the regions that contain this subplot
            matchidx <- as.data.frame(which(layout == i, arr.ind = TRUE))
            
            print(plots[[i]], vp = viewport(layout.pos.row = matchidx$row,
                                            layout.pos.col = matchidx$col))
        }
    }
}

