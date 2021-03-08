clps<-function(data, metric){
  d<-nrow(metric)
  
  collapsed<-matrix(0,nrow=nrow(data),ncol=ncol(data))
  collapsed<-as.data.frame(matrix(nrow=nrow(data),ncol=ncol(data)))
  colnames(collapsed)<-colnames(data)
  for(i in 1:nrow(data)){
    for(j in 1:ncol(data)){
      for(k in 1:d){
        if(data[i,j] >= metric[k,1] & data[i,j] <= metric[k,2]){collapsed[i,j] = k}
      }
    }
  }
  return(collapsed)
}