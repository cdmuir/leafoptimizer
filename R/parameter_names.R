#' Get vector of parameter names
#' 
#' @param which A character string indicating which parameter names to retreive, "leaf", "enviro", or "constants". Partial matching allowed.

parameter_names <- function(which) {
  
  which %>% 
    match.arg(c("leaf", "enviro", "constants")) %>%
    switch(
         leaf = c("abs_l", "abs_s", "g_ic", "g_sw", "g_uw", "g_xc", "gamma_star", 
                  "J_max", "K_c", "K_o", "k_x", "leafsize",  "R_d", "sr", "V_cmax"),
         enviro = c("C_air", "O", "P", "R_lw", "R_sw", "RH", "T_air", "wind"),
         constants = c("c_p","D_h0", "D_m0", "D_w0", "eT", "G", "nu_constant",
                       "phi", "R", "R_air", "s", "sh_constant", "t_air", "thetaJ")
  )
  
}