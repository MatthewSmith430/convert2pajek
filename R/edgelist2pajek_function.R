#' @title edgelist2pajek
#' @description This function converts a edgelist dataframe to a .net files. Dataframe has two columns for binary, and three for weighted (third column is weights)
#' @param df Edgelist Dataframe
#' @param directed TRUE/FALSE
#' @param NAME Name for .net file
#' @export
#' @return .net file
edgelist2pajek<-function(df,directed,NAME){
  gs<-igraph::graph_from_data_frame(df,directed=directed)
  fileNAME<-paste0(NAME,".net")
  igraph::write_graph(gs,fileNAME,format = "pajek")
}
