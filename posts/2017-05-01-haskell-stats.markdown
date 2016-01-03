---
title:  "Haskell measuring function performance"
tags: haskell
---

# GC statistics
To check if garbage collection isn't the problem.
```sh
λ ghc -O2 app.hs && time ./app +RTS -s
```
As we can see below. Our program used a maximum of 2 megabytes on the heap, 
and spent 0.9% of its time doing garbage collection. 
In total, 98.9% of the program's running time was spent doing productive work.
```sh
λ ghc -O2 003.hs && time ./003 +RTS -s
6857
      24,873,640 bytes allocated in the heap
          14,008 bytes copied during GC
          44,504 bytes maximum residency (2 sample(s))
          29,224 bytes maximum slop
               2 MB total memory in use (0 MB lost due to fragmentation)

                                     Tot time (elapsed)  Avg pause  Max pause
  Gen  0        22 colls,     0 par    0.001s   0.001s     0.0000s    0.0002s
  Gen  1         2 colls,     0 par    0.000s   0.000s     0.0000s    0.0001s

  INIT    time    0.000s  (  0.000s elapsed)
  MUT     time    0.089s  (  0.090s elapsed)
  GC      time    0.001s  (  0.001s elapsed)
  EXIT    time    0.000s  (  0.000s elapsed)
  Total   time    0.090s  (  0.091s elapsed)

  %GC     time       0.9%  (0.9% elapsed)

  Alloc rate    280,897,811 bytes per MUT second

  Productivity  98.9% of total user, 98.9% of total elapsed


real	0m0.094s
user	0m0.088s
sys	0m0.005s
```

# Time profiling
```
λ ghc -O2 --make 003.hs -prof -fprof-auto -fprof-cafs -fforce-recomp
[1 of 1] Compiling Main             ( 003.hs, 003.o )
Linking 003 ...
λ time ./003 +RTS -p
6857

real	0m0.126s
user	0m0.124s
sys	0m0.001s
```
If program run out of stack space then use flag, -K, to set a larger stack limit for our program.
```
λ time ./003 +RTS -p -K100M
003: Most RTS options are disabled. Link with -rtsopts to enable them.

real	0m0.008s
user	0m0.000s
sys	0m0.008s
```
