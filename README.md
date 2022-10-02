# trs-benchmark

## What is it? 
This program aims to compare performance of *tracking_bigraph* library with *bigraph* library.
## How to run it?
Build it first. To do so you are going to need both of the above libraries installed.
There are 4 benchmarks available, each can be run with one of the following tools:
1. *bigraph* library - LTS - it computes a labelled transition system.
2. *tracking_bigraph* library - TTS - it computes a tracking transition system and saves it to `states.csv` and `transitions.csv` file.
3. *tracking_bigraph* library utilizing multiple cores - PTTS - same as the above with the exception performs some operations in parallel. Make sure you have a lot of RAM available.

The benchmarks differ in sizes, thus the following naming convnetion:
1. `slim` - A very small (L/T)TS consiting of 541 states and 1488 transitions.
2. `default` - A moderate transition system consiting of 17774 states and 72371 transitions.
3. `plus` - A transition system made of an initial state extended by a single node compare to the `default`. It consists of 53856 states and 235813 transitions between them.
3. `extra` - The biggest benchmark included. It consists of 464947 (400K+) states and 2855022 (2M+) transitions. Make sure you have at least 20 gigs of RAM if you run it on a single core. For 12 core benchmark it requires about 60 GB.

In order to run the `default` benchmark using *tracking_bigraph* on a single core, execute the following command:
```
dune exec main default tts
```
To run the same benchmark utilizing 6 cores run:
```
dune exec main default ptts 6
```
## What to expect?
A lot of calculations. 
The `default` benchmark on a single core takes about 4 minutes on a Ryzen CPU using *tracking_bigraph* library.
The `extra` benchmark on the same CPU requires 30 hours to complete on a single core.

If you run the `extra` make sure to set the stack size to unlimited with:
```
ulimit -s unlimited
```
otherwise after few hours the app will crash. 

