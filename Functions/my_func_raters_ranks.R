my_ranks<-function(data){
  rownames(data)<-row.names(data)
  tots<-apply(data[,2:ncol(data)],1,sum,na.rm = TRUE)
  ranks<-as.numeric(factor(desc(rank(tots))))
  tots1<-cbind.data.frame(tots, ranks)
  return(tots1) 
}
