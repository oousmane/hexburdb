# helpers for dominant soil analysis

.get_mode <- function(x,...) {
  u <- unique(x)
  tab <- tabulate(match(x, u))
  m <- u[tab == max(tab,...)]
  # m <- as.character(m)
  if (length(m)>1L) m <- m[1]
  return(m)
}
mode_ee_output <- function(df){
  cov_col <- which(startsWith(x = names(df),prefix="coverage"))
  df <- df[,-cov_col]
  x <- unlist(c(df)) %>% 
    unname()
  .get_mode(x)
}