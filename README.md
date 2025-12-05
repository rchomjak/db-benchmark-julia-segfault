
The behaviour has slightly changed, you have to add `print(x)` in `julia_script.jl`, otherwise I wasn't able to spot the segfault.

The `julia_segfault.R ` is changed too, the problem is `LD_LIBRARY_PATH`, so with the fix it works.



# How to run it
``` shell
cd db-benchmark-julia
export JULIA_PROJECT=$(pwd)
(base) a@sirius:~/devel/julia/db-benchmark-julia$ Rscript julia_segfault.R 
┌ Warning: Julia started with single thread, to enable multithreaded functionalities in InMemoryDatasets.jl start Julia with multiple threads.
└ @ InMemoryDatasets ~/.julia/packages/InMemoryDatasets/aSzMi/src/InMemoryDatasets.jl:208
┌ Warning: the last line is not ended with `end of line` character
└ @ DLMReader ~/.julia/packages/DLMReader/9D8wj/src/reader.jl:449
                                                   9×9 Dataset
┌─────┬────────────┬────────────┬──────────────┬──────────┬──────────┬──────────┬──────────┬──────────┬──────────┐
│ Row │ id1        │ id2        │ id3          │ id4      │ id5      │ id6      │ v1       │ v2       │ v3       │
│     │ identity   │ identity   │ identity     │ identity │ identity │ identity │ identity │ identity │ identity │
│     │ Characte…? │ Characte…? │ Characte…?   │ Int32?   │ Int32?   │ Int32?   │ Int32?   │ Int32?   │ Float64? │
├─────┼────────────┼────────────┼──────────────┼──────────┼──────────┼──────────┼──────────┼──────────┼──────────┤
│   1 │ id016      │ id016      │ id0000042202 │       15 │       24 │     5971 │        5 │       11 │  37.2113 │
│   2 │ id039      │ id045      │ id0000029558 │       40 │       49 │    39457 │        5 │        4 │  48.9511 │
│   3 │ id047      │ id023      │ id0000071286 │       68 │       20 │    74463 │        2 │       14 │  60.4692 │
│   ⋮ │ ⋮          │ ⋮          │ ⋮            │        ⋮ │        ⋮ │        ⋮ │        ⋮ │        ⋮ │        ⋮ │
│   7 │ id047      │ id023      │ id0000084849 │       90 │       96 │    35790 │        2 │        9 │  93.3481 │
│   8 │ id091      │ id022      │ id0000031441 │       50 │       44 │    71525 │        3 │       11 │  81.0137 │
│   9 │ id090      │ id048      │ id0000067778 │       24 │        2 │    51862 │        4 │        9 │  30.7188 │
└─────┴────────────┴────────────┴──────────────┴──────────┴──────────┴──────────┴──────────┴──────────┴──────────┘
                                                                                                    3 rows omitteddone loading...

```
```
(base) a@sirius:~/devel/julia/db-benchmark-julia$ Rscript julia_segfault.R 
┌ Warning: Julia started with single thread, to enable multithreaded functionalities in InMemoryDatasets.jl start Julia with multiple threads.
└ @ InMemoryDatasets ~/.julia/packages/InMemoryDatasets/aSzMi/src/InMemoryDatasets.jl:208
┌ Warning: the last line is not ended with `end of line` character
└ @ DLMReader ~/.julia/packages/DLMReader/9D8wj/src/reader.jl:449
                                                   9×9 Dataset
┌─────┬────────────┬────────────┬──────────────┬──────────┬──────────┬──────────┬──────────┬──────────┬──────────┐
│ Row │ id1        │ id2        │ id3          │ id4      │ id5      │ id6      │ v1       │ v2       │ v3       │
│     │ identity   │ identity   │ identity     │ identity │ identity │ identity │ identity │ identity │ identity │
│     │ Characte…? │ Characte…? │ Characte…?   │ Int32?   │ Int32?   │ Int32?   │ Int32?   │ Int32?   │ Float64? │
├─────┼────────────┼────────────┼──────────────┼──────────┼──────────┼──────────┼──────────┼──────────┼──────────┤
│   1 │ id016      │ id016      │ id0000042202 │       15 │       24 │     5971 │        5 │       11 │  37.2113 │
│   2 │ id039      │ id045      │ id0000029558 │       40 │       49 │    39457 │        5 │        4 │  48.9511 │
│   3 │ id047      │ id023      │ id0000071286 │       68 │       20 │    74463 │        2 │       14 │  60.4692 │
│   ⋮ │ ⋮          │ ⋮          │ ⋮            │        ⋮ │        ⋮ │        ⋮ │        ⋮ │        ⋮ │        ⋮ │
│   7 │ id047      │ id023      │ id0000084849 │       90 │       96 │    35790 │        2 │        9 │  93.3481 │
│   8 │ id091      │ id022      │ id0000031441 │       50 │       44 │    71525 │        3 │       11 │  81.0137 │
│   9 │ id090      │ id048      │ id0000067778 │       24 │        2 │    51862 │        4 │        9 │  30.7188 │
└─────┴────────────┴────────────┴──────────────┴──────────┴──────────┴──────────┴──────────┴──────────┴──────────┘
```




# Info about R, and Julia
```R
(base) a@sirius:~/devel/julia/db-benchmark-julia$ R

R version 4.5.0 (2025-04-11) -- "How About a Twenty-Six"
Copyright (C) 2025 The R Foundation for Statistical Computing
Platform: x86_64-pc-linux-gnu

...

> version
               _                           
platform       x86_64-pc-linux-gnu         
arch           x86_64                      
os             linux-gnu                   
system         x86_64, linux-gnu           
status                                     
major          4                           
minor          5.0                         
year           2025                        
month          04                          
day            11                          
svn rev        88135                       
language       R                           
version.string R version 4.5.0 (2025-04-11)
nickname       How About a Twenty-Six      
> 
```

```julia
(base) a@sirius:~/devel/julia/db-benchmark-julia$ julia --version
julia version 1.12.2
```
