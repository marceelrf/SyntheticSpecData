final_tbl <- tibble(x_spec, spec = spec_final)



ggpeaks <- function(.x, .params){

  spec <- NULL
  for (i in 1:nrow(.params)) {

    spec[[i]] <- amp[i]*voigt(x = .x,
                              x0 = .params$x0[i],
                              sigma = .params$sigma_x[i],
                              gamma = .params$gamma_x[i])


  }
  spec_final <- reduce(spec, `+`)

  as_tibble_col(transpose(spec),
                column_name = "spec") %>%
    unnest_wider(col = spec,
                 names_sep = "_") %>%
    mutate(x = .x,
           total = spec_final) %>%
    pivot_longer(cols = starts_with("spec_"),
                 names_to = "peak",
                 values_to = "vals") %>%
    mutate(peak = factor(peak),
           peak = fct_relevel(peak,
                              paste("spec_",1:15,sep = ""))) %>%
    ggplot(aes(x = x, y = total)) +
    geom_line() +
    geom_area(aes(y = vals, fill = peak, col = peak),
              alpha = .4,
              position = "identity") +
    scale_fill_viridis(discrete = T) +
    scale_color_viridis(discrete = T)


}



ggpeaks(.x = x_spec,.params = params_tab)
