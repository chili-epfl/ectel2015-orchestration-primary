require(stringr)

# This function takes the audiocoding file (with multiple codes possible for each episode)
# and performs a simple code count along with measures of subjective and eyetracking load of each episode
# It returns a plain dataset that can then be aggregated in different ways
codeCount <- function(data){
    
    # We get the list of possible codes
    codes <- unique(str_trim(unlist(strsplit(as.character(data$Codes),split = ",",fixed = T))))
    
    # We go over the data, and create a new dataframe
    codecount <- data.frame()
    for(i in 1:nrow(data)){
        episode <- data[i,]
        episodecodes <- unique(str_trim(unlist(strsplit(as.character(episode$Codes),split = ",",fixed = T))))
        if(length(episodecodes)>0){
            # For each code in the episode, we create a new row in the plain data            
            for(code in episodecodes){
                if(nrow(codecount)==0) codecount <- data.frame(Code = code, Eyetrack.Load = episode$Eyetrack.Load, Subj.Load = episode$Subj.Load )
                else{
                    newrow <- data.frame(Code = code, Eyetrack.Load = episode$Eyetrack.Load, Subj.Load = episode$Subj.Load )
                    codecount <- rbind(codecount,newrow)
                }
            }
        }
        
        
    }
    
    # We return the plain dataframe generated
    codecount$Code <- factor(codecount$Code)
    codecount
}