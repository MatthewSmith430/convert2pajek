#' @title edgelist2pajek
#' @description This function converts a edgelist dataframe to a .net files. Dataframe has two columns for binary, and three for weighted (third column is weights)
#' @param df Edgelist Dataframe
#' @param weighted TRUE/FALSE
#' @param directed TRUE/FALSE
#' @param NAME Name for .net file
#' @export
#' @return .net file
edgelist2pajek<-function(df, weighted, directed,NAME){
  if (directed==TRUE){
    el<-as.matrix(df)
    el<-el[,1:2]
    gs<-igraph::graph_from_edgelist(el,directed=TRUE)
  }else{
    el<-as.matrix(df)
    el<-el[,1:2]
    gs<-igraph::graph_from_edgelist(el,directed=FALSE)
  }

  if (weighted==TRUE){
    R<-as.matrix(df)
    R1<-as.numeric(R[,3])
    igraph::E(gs)$weight<-R1
  } else{
    gs<-gs
  }

  fileNAME<-paste0(NAME,".net")

  igraph::write_graph(gs,fileNAME,format = "pajek")
}
