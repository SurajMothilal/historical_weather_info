#! /bin/sh
token=$(jq -r '.key' variables.json)
url="api.openweathermap.org/data/2.5/weather?id=6167865&appid="$token""
weather_details=$(curl "$url")
time=$(echo "$weather_details" | jq -r '.dt')
temp=$(echo "$weather_details" | jq '.main.temp')
feels_like=$(echo "$weather_details" | jq '.main.feels_like')
temp_min=$(echo "$weather_details" | jq '.main.temp_min')
temp_max=$(echo "$weather_details" | jq '.main.temp_max')
pressure=$(echo "$weather_details" | jq '.main.pressure')
humidity=$(echo "$weather_details" | jq '.main.humidity')
echo "$time \t $temp \t $feels_like \t $temp_min \t $temp_max \t $pressure \t $humidity \n" >> data.md

