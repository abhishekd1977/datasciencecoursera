###Week#2 Quiz- Part 3###########
corr <- function(directory, threshold = 0){
    setwd(directory)
    file_list <- list.files()
    dataset <- head(read.csv(file_list[1], header = TRUE, sep = ","), n = 0)
    for (x in file_list){
        dataset <- rbind(dataset, read.csv(x, header = TRUE, sep = ","))
    }
    cr = dataset[complete.cases(dataset), ]
    complete_data_df <- data.frame(table(cr$ID))
    colnames(complete_data_df) <- c("id", "nobs")
    
    cor.result <- by(cr[,2:3], cr$ID, function(cr) {cor(cr$sulfate, cr$nitrate)})
    cor.result.dataframe <- as.data.frame(as.matrix(cor.result))
    colnames(cor.result.dataframe) <- c("cor")
    
    merged.data <- cbind(complete_data_df, cor.result.dataframe)
    final.data <- subset(merged.data, nobs > threshold, select = "cor")
    final.data[[1]]
}