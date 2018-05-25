#' @title matrix2pajek
#' @description This function converts a matrix to a .net files. Dataframe has two columns for binary, and three for weighted (third column is weights)
#' @param mat matrix
#' @param weighted TRUE/FALSE
#' @param directed TRUE/FALSE
#' @param NAME Name for .net file
#' @export
#' @return .net file
matrix2pajek<-function(mat, weighted, directed, NAME){
  if (directed==TRUE&weighted==TRUE){
    gs<-igraph::graph_from_adjacency_matrix(mat,
                                            mode="directed",
                                            weighted = TRUE)
  }else if (directed==TRUE&weighted!=TRUE){
    gs<-igraph::graph_from_adjacency_matrix(mat,
                                            mode="directed",
                                            weighted = NULL)

  }else if (directed!=TRUE&weighted==TRUE){
    gs<-igraph::graph_from_adjacency_matrix(mat,
                                            mode="undirected",
                                            weighted = TRUE)

  }else {
    gs<-igraph::graph_from_adjacency_matrix(mat,
                                            mode="undirected",
                                            weighted = NULL)

  }

  fileNAME<-paste0(NAME,".net")

  igraph::write_graph(gs,fileNAME,format = "pajek")
}
