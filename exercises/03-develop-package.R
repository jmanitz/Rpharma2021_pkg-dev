# --- Part II ------------------------------------------------------------------
# Juliane - please add whatever you'd like to this file!

# --- I have a package structure, now what? ------------------------------------

use_r("my_func")    # creates and opens R files, shortcut to open R files, ctrl + .
use_test("my_func")

# --- Tools to manage your DESCRIPTION and NAMESPACE ---------------------------
use_package("dplyr")
use_package("here", type = "Suggests")
use_pipe()
use_tibble()

# --- I have a package with functions, now what? -------------------------------

# largely from `devtools`
check()    # cmd + shift + e
test()     # cmd + shift + t
document() # cmd + shift + d
# load_all, unlike source, functions/data are not dumped to your global environment
load_all() # cmd + shift + L
install()
# install.packages("path/to/package/folder", repos = NULL, type = "source")
