# tim's .Rprofile
#
.First <- function() {

  # where I like to keep my libraries
  Sys.setenv("R_PDFVIEWER"="/usr/bin/evince")
  Sys.setenv(TENSORFLOW_PYTHON="/usr/bin/python3.6")
  options("repos" = c(CRAN = "http://cran.rstudio.com/"),
                      browserNLdisabled = TRUE,
                      deparse.max.lines = 2)

  for(i in list.files("~/.Rscripts/")) source(paste0("~/.Rscripts/",i))

  if (interactive()) {
    cat("\nWelcome to",R.version.string,"\n")
  
    loadOrInstall <- function(x) {
      if(!require(x, character.only=TRUE)) install.packages(x)
      require(x, character.only=TRUE) 
    }

    packages <- c("utils","knitr","purrr","useful","gtools","magrittr") # dplyr?
    for (pkg in packages) loadOrInstall(pkg)
    if (!require(BiocInstaller)) {
      source("http://bioconductor.org/biocLite.R")
      biocLite()
    }
    
    # for roxygenise()
    rox <<- roxygen2::roxygenise
    dox <<- devtools::document

    # change some defaults
    options("digits"=9)
    options("max.print"=9999)
    options("biocLiteAsk"=FALSE)
    options("pdfviewer"="/usr/bin/evince")
    options("browser"="/opt/google/chrome/chrome")
    options("scipen" = 9999)
    options("prompt"="R> ")
  
    ## tab-complete libraries
    rc.settings(ipck=TRUE)

    # should always be the case IMHO
    options("stringsAsFactors" = FALSE)
    options("useFancyQuotes" = FALSE)

    # many thanks to Duncan Murdoch and Ivo Welch
    message("Set options('warn'=2) to stop on warnings...")
    options("warn"=0) ## or =2 to stop on warnings

    # get LyX to quit fucking up
    options(lyx.use.encoding = FALSE)
   
    # set up bigrquery 
    # library("bigrquery")
    # billing_project <- is set in ~/.Rscripts/bigquery.R

  }
}
 
# I like syntax highlighting, too
if (interactive()) {
  lf <- list.files
  lrda <- function(...) list.files(pattern="rda$", ...)
  lrds <- function(...) list.files(pattern="rds$", ...)

  local({ 
    options(editor="vim") 
  })
  # options(contrasts=c("contr.sum","contr.poly"))
  # for RM-ANOVA and so forth

  ## like magrittr, but better:
  `|` <- function(x, y) {
    if(is.data.frame(x)) {
      return(eval(call("%.%", substitute(x), substitute(y)), 
                  envir=parent.frame()))
    } else {
      or <- base::"|"
      return( or(x, y) )
    }
  }

  # get or set the DISPLAY environment variable
  getDisp <- function() Sys.getenv("DISPLAY")
  setDisp <- function(x) Sys.setenv("DISPLAY"=x)

  # quote words, like in perl
  qw <- function(...) sapply(match.call()[-1], deparse)

# Now in its own script in ~/.Rscripts/phelp.R 
#
# phelp <- function(...) { # {{{ get help for a package
#   help(package=as.character(sapply(match.call()[-1], deparse)[1]))
# } # }}}
#

# Now in its own script in ~/.Rscripts/lsos.R
#
# lsos <- function(..., n=10) { 
#   .ls.objects(..., order.by="Size", decreasing=TRUE, head=TRUE, n=n)
# }

  latexify <- function(filebase, pgf=TRUE) { # {{{
    filebase <- gsub(".Rnw","",filebase)
    filebase <- gsub(".rnw","",filebase)
    filebase <- gsub(".tex","",filebase)
    if(pgf) {
      require(pgfSweave)
      pgfSweave(paste(filebase, "Rnw", sep="."))
    } else {
      Sweave(paste(filebase, "Rnw", sep="."))
    }
    system(paste("LaTeXify", paste(filebase, "tex", sep=".")))
  } # }}}

# Now in its own script in ~/.Rscripts/print.data.frame.R
#
# print.data.frame <- function(df) { # {{{
#   if (ncol(df) > 0 && require("IRanges")) {
#     prev.max.print <- getOption("max.print")
#     on.exit(options(max.print=prev.max.print))
#     options(max.print=ncol(df) * 20)
#     x <- capture.output(print(as(df, "DataFrame")))
#     cat(sub("DataFrame", "data frame", x[[1]]), x[-1], sep="\n")
#   } else {
#     base::print.data.frame(df)
#   }
# } # }}}

  # AWS stuff now in ~/.Rscripts/AWS.R

  host <- function() system2("hostname", stdout=T)
}
