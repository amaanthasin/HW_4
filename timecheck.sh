#!/bin/bash

best_fitness=0
best_seed=0

echo "Seed,Fitness,Time" > results.csv

for SEED in {1..10}
do
    echo "Running SEED=$SEED..."
    { time_output=$( (time ./revGOL cmse2.txt $SEED) 2>&1); } 2>/dev/null
    fitness=$(echo "$time_output" | grep "Result Fitness=" | awk -F'=' '{print $2}' | awk '{print $1}')
    time_taken=$(echo "$time_output" | grep "real" | awk '{print $2}')

    echo "$SEED,$fitness,$time_taken" >> results.csv

    if [ "$fitness" -gt "$best_fitness" ]; then
        best_fitness=$fitness
        best_seed=$SEED
        echo "$time_output" > serial_best.txt
    fi
done

echo "Best fitness: $best_fitness (Seed $best_seed)"
