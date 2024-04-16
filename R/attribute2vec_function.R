#' @title attribute2vec
#' @description This function converts attribute from a dataframe to a .vec file. 
#' @param df Attribute Dataframe
#' @param attribute Attribute Name - Column name (character) in dataframe to write to .vec file. 
#' @param NAME Name for .vec file
#' @export
#' @return .vec file
attribute2vec<-function(df,attribute,NAME){
  v<-dplyr::select(df, attribute)
  v<-as.vector(v[,1])
  filename<-paste0(NAME,".vec")
  if (length(grep(pattern = "w32", x = version["os"]))) {
    eol <- "\n"
  }
  else {
    eol <- "\r\n"
  }
  cat(paste(c(paste("*Vertices", length(v)), v), collapse = eol),
      file = filename)
}
