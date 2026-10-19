@echo off

:: Create directory
if not exist "data" mkdir "data"

:: Download Weather CSV
echo Downloading weather data...
curl -o data\nyc_weather_2023.csv "https://archive-api.open-meteo.com/v1/archive?latitude=40.7143&longitude=-74.006&start_date=2023-01-01&end_date=2023-12-31&hourly=temperature_2m,relative_humidity_2m,weather_code,apparent_temperature,precipitation,rain,snowfall,wind_speed_10m&utm_source=chatgpt.com&format=csv"

:: Download CitiBike Data
echo Downloading Citi Bike data...
curl -o data\citibike.zip "https://s3.amazonaws.com/tripdata/2023-citibike-tripdata.zip"

:: Extract Zip using Windows native tar command
echo Extracting Citi Bike data...
tar -xf data\citibike.zip -C data\
del data\citibike.zip

echo Extracting monthly sub-archives...
for %%f in (data\2023-citibike-tripdata\*.zip) do (
    echo Unpacking %%f...
    tar -xf "%%f" -C data\2023-citibike-tripdata_\
    del "%%f"
)

echo Done!
pause
