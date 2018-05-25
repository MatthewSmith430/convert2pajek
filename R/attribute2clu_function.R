#' @title attribute2clu
#' @description This function converts a attribute from a  dataframe to a .net files. Dataframe has two columns for binary, and three for weighted (third column is weights)
#' @param df Attribute Dataframe
#' @param attribute Attribute Name - Column name (character) in dataframe to write to .clu file
#' @param NAME Name for .clu file
#' @export
#' @return .clu file
#'
attribute2clu<-function(df,attribute,NAME){
  v<-dplyr::select(df, attribute)
  v<-as.vector(v[,1])
  filename<-paste0(NAME,".clu")
  if (length(grep(pattern = "w32", x = version["os"]))) {
    eol <- "\n"
  }
  else {
    eol <- "\r\n"
  }
  cat(paste(c(paste("*Vertices", length(v)), v), collapse = eol),
      file = filename)
}
