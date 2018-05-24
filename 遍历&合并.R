# list.files & rbind dataset

setwd( "F:\\数据分析需求\\2017.09\\2017.09.06-0 新闻渠道（智汇推、UC、百度feed）\\UC")

file_list <- list.files( ".", pattern = "计划")

dataset <- data.frame()
for( i in file_list){
  temp_file <- read.csv( i,  stringsAsFactors = F, header = T)
  dataset <- rbind( dataset, temp_file)
  remove( temp_file)
}
write.csv( dataset, "UC_Dataset.csv", row.names = F)


# --- 需要处理的版本 ---
library( dplyr)

setwd( "D:\\R_Working_Directory\\Data\\source")

result_file <- data.frame()

for( i in list.files( ".")){ # i = 文件夹名
  
  fold_name <- as.character( i) # 文件夹名，用于下一个 for 中的赋值
  setwd( paste0( getwd(), "\\", i) ) # 构建第二阶文件路径
  
  for( j in list.files( ".", ".csv")){ # j = 文件名
    file_name <- as.character( j ) # 文件名
    temp_file <- read.csv( j, stringsAsFactors = FALSE) #
    temp_file <- mutate( temp_file, `文件夹名` = fold_name , `文件名` = file_name ) # 新增加两列
    result_file <- rbind( result_file, temp_file) # 追加文件
    rm( temp_file) # 删除临时变量
  }
  setwd( "D:\\R_Working_Directory\\Data\\source") # 设回原wd
}

write.csv( result_file, "result_file.csv", row.names = FALSE)
