myraters<-function(data){
  d<-ncol(data)
  dif<-NULL
  name<-NULL
  
  for(i in 1:(d-1)){
    for(j in (i+1):d){
      name<-c(name,paste0(i," vs ",j))
      dif<-cbind(dif, data[,i] - data[,j])
    }
  }
  colnames(dif)<-name
  
  pa<-round(apply(dif,2,function(x) mean(x==0))*100,2)
  mean.pa<-round(mean(pa),2)
  sd.pa = round(sd(pa),2)
  max.pa<-max(pa)
  min.pa<-min(pa)
  return(t(data.frame(pa=pa,mean.pa=mean.pa,sd.pa=sd.pa,max.pa=max.pa,min.pa=min.pa)))
}
myraters(data)


####################################
# percent agreement based on two rater vectors
Percent_Agreement<-function(rater1,rater2){
  r12_agree<-100*(sum(rater1==rater2)/length(rater1))
  return(r12_agree)
}

# fxn to provide stats agreement for all raters
rater_stats<-function(ratings){
  # here we determine the number of raters
  numb_raters<-ncol(ratings)
  # here we set up PA data frame
  PA<-as.data.frame(matrix(nrow=numb_raters-1,ncol=numb_raters))
  # here we set up PA stats data frame
  PA_stats<-as.data.frame(matrix(nrow=4,ncol=numb_raters))
  rownames(PA_stats)<-c("MEAN","SD","MIN","MAX")
  colnames(PA_stats)<-colnames(ratings)
  # We calculate PA for each rater and store in a matrix
  for(i in 1:(numb_raters-1)){
    for(j in (i+1):numb_raters){
      Raters_PA<-Percent_Agreement(ratings[,i],ratings[,j])
      PA[j-1,i]<-Raters_PA
      PA[i,j]<-Raters_PA
    }
  }
  PA_stats[1,]<-sapply(PA,mean)
  PA_stats[2,]<-sapply(PA,sd)
  PA_stats[3,]<-sapply(PA,mean)
  PA_stats[4,]<-sapply(PA,max)
  # get data frame
  return(PA_stats)
}
