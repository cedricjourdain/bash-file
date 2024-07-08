#!/bin/bash

for i in 800 900 1000 1100 1200 1300 1400 1500 1600 1700
  do sbatch --gpu-srange=700-$i --output=result_8GPU_pemap_$i soa.slurm
done
