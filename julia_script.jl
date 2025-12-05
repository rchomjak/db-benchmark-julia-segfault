#!/usr/bin/env julia

using InMemoryDatasets;
using Printf;
using DLMReader;
using PooledArrays;

x = filereader("./small.csv", types=[Characters{5}, Characters{5}, Characters{12}, Int32, Int32, Int32, Int32, Int32, Float64]);
print(x)
print("done loading...\n"); flush(stdout);
