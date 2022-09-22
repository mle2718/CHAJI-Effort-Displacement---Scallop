pretty_tab <- function(tab, full_width = FALSE) {
  
  tab %>% 
    kbl() %>%
    kable_styling(bootstrap_options = c("striped", "condensed"),
                  full_width = full_width) 
} 
# scroll box for large tables
pretty_tab_sb <- function(tab, width = "100%", 
                          height = "500px", 
                          full_width = FALSE) {
  
  tab %>% 
    pretty_tab(full_width) %>% 
    scroll_box(height = height, width = width)
}
# label formatting
pretty_lab <- function(tab, cols = "all", type = "pretty", ignore = NULL) {

  # check that all cols are numeric
  if (length(cols) == 1 && cols == "all") {
    
    cols <- qaqc_helper(tab, is.numeric, output = "names")
  }
  
  if (!is.null(ignore)) cols <- cols[!cols %in% ignore]
  
  if (type == "decimal") {
    
    tab %>% 
      mutate(across(all_of(cols), .fns = function(x) round(x, 2)))
    
  } else if (type == "pretty") {
    
    tab %>% 
      mutate(across(all_of(cols), .fns = function(x) prettyNum(round(x, 2), big.mark = ",")))
    
  } else if (type == "scientific") {
    
    tab %>% 
      mutate(across(all_of(cols), .fns = function(x) formatC(x, format = "e", digits = 2)))
  }
}

# tilt x-axis text
angled_theme <- function() {
  
  ggplot2::theme(axis.text.x = ggplot2::element_text(angle = 45, hjust = 1, size = 8))
}