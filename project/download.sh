#!/bin/bash

mkdir -p data

echo "Downloading weather data..."
curl -o data/nyc_weather_2023.csv "https://archive-api.open-meteo.com/v1/archive?latitude=40.7143&longitude=-74.006&start_date=2023-01-01&end_date=2023-12-31&hourly=temperature_2m,relative_humidity_2m,weather_code,apparent_temperature,precipitation,rain,snowfall,wind_speed_10m&utm_source=chatgpt.com&format=csv"

echo "Downloading Citi Bike data..."
curl -o data/citibike.zip "https://s3.amazonaws.com/tripdata/2023-citibike-tripdata.zip"

echo "Extracting Citi Bike data..."
unzip data/citibike.zip -d data/
rm data/citibike.zip

echo "Extracting monthly sub-archives..."
for f in data/2023-citibike-tripdata/*.zip; do
    [ -e "$f" ] || continue
    echo "Unpacking $f..."
    unzip "$f" -d data/2023-citibike-tripdata_/
    rm "$f"
done

echo "Done!"
