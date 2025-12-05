
# Without it, it still segfaults:
Sys.setenv(LD_LIBRARY_PATH="")

system("julia julia_script.jl")