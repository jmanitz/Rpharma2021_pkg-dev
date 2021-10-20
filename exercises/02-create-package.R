library(devtools) # `usethis` is dependency, so gets loaded here

# Part I
#--- unique path to package ----------------------------------------------------
# Should not be within another R package, project, or git repo

create_package("../pkgdev")
fs::dir_ls()
edit_file("DESCRIPTION")
edit_file("NAMESPACE")

# --- Create directory structure for unit tests---------------------------------

use_testthat()

#--- Create data directories ---------------------------------------------------

use_data_raw("useful_data")

mtcars_trim <- head(mtcars)
use_data(mtcars_trim)

# --- Add a README -------------------------------------------------------------
# 1) useful for github/package down
# 2) use to instruct someone on your package setup

use_readme_rmd()

# --- vignettes ---------------------------------------

use_vignette("specific-vignette")
use_article("specific-article")

# Part I - Bonus!
# --- Other bells and whistles -------------------------------------------------

use_spell_check()
use_news_md()
use_version()
use_agpl3_license()
use_rmarkdown_template("sweet-template")

# Git
usethis::use_git()
usethis::use_github()

# CI/CD
usethis::use_travis()

