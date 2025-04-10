#!/bin/bash
#SBATCH --job-name=revGOL_serial
#SBATCH --time=4:00:00
#SBATCH --output=serial_output.log
#SBATCH --ntasks=1
#SBATCH --mem=2G

bash timecheck.sh
