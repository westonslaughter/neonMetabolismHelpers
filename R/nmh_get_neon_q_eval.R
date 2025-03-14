#' Download NEON discharge evaluation
#'
#' @author Nick Marzolf, \email{@@}
#' @author Wes Slaughter, \email{wslaughter@@berkeley.edu}
#'
#' @param dest_fp character. file path to download data into.
#' @details
#' @seealso [nmh_get_hydraulic_coef_data()], [nmh_get_neon_data()], [nmh_get_neon_q_sim()], [nmh_get_scaling_coefs()], [nmh_get_tomb_q()]
#' @examples
#' nmh_get_neon_q_eval()
#' @export
nmh_get_neon_q_eval <- function(dest_fp = 'data/raw/qaqc/',
                                dest_fn = 'neon_q_eval.csv',
                                download = FALSE) {
  
  if(download) {
    destfile <- file.path(dest_fp, dest_fn)


    if(!dir.exists(dest_fp)){
      # create direcotry if doesnt exists
      print(paste('Directory does not exist, creating dir at:', dest_fp))
      dir.create(dest_fp, recursive = TRUE)
    }

    # read in the discharge evaluation from Rhea et al. 2023
    # Data citation:
    # Rhea, S. NEON Continuous Discharge Evaluation. HydroShare https://doi.org/10.4211/hs.03c52d47d66e40f4854da8397c7d9668 (2023).
    # NOTE: must make sure function runs the same in case there have been any updates to data format in Hydroshare
    download.file(
      url = 'https://www.hydroshare.org/resource/03c52d47d66e40f4854da8397c7d9668/data/contents/neon_q_eval.csv',
      destfile = destfile
    )

    q_eval <- read.csv(destfile)
    return(q_eval)

  } else {
    return(nmh_q_eval)
  }
}
