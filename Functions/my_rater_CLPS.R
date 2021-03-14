# This function can be used to collapse rating categories

my_rater_clps <- function(ratings, collapse_cats){
  collapse_cats<-matrix(c(1,2,3,4,5,6),nrow=3,ncol=2,byrow=TRUE)
  # Obtain the number of new categories.
  
  num_cats <- nrow(collapse_cats)
  
  # Replace old ratings with new ratings.
  
  for (i in 1:num_cats){
    
    ratings[ratings >= collapse_cats[i, 1] &
              ratings <= collapse_cats[i, 2]] <- i
    
  }
  
  return(ratings)
  
}
