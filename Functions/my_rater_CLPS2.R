# This function can be used to collapse rating categories

my_rater_clps2<- function(ratings, collapse_cats2){
  collapse_cats2<-matrix(c(1,1,2,2,3,4,5,5,6,6),nrow=5,ncol=2,byrow=TRUE)
  # Obtain the number of new categories.
  num_cats2<- nrow(collapse_cats2)
  
  # Replace old ratings with new ratings.
  
  for (i in 1:num_cats2){
    
    ratings[ratings >= collapse_cats2[i, 1] &
              ratings <= collapse_cats2[i, 2]] <- i
    
  }
  
  return(ratings)
}
  