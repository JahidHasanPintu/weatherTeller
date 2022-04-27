#!/bin/bash
#Written by Jahid Hasan Pintu

echo "--------------------------------------------"
echo "             --- Weather APP---             "
echo "      Scripted : Md. Jahid Hasan Pintu"
echo "--------------------------------------------"

#Taking input
echo "Enter City Name: "
read city


url="https://api.openweathermap.org/data/2.5/weather?q="$city"&units=metric&appid=427c9db7551d4ba7dd7d63e05714621f"
json="$(wget -qO- "$url")"

#Assigning variable from json

temp=$(echo $json|jq -r ."main"."temp")
feelsLike=$(echo $json|jq -r ."main"."feels_like")
humidity=$(echo $json|jq -r ."main"."humidity")
weather=$(echo $json|jq -r ."weather[0]"."main")
location=$(echo $json|jq -r ."name")
country=$(echo $json|jq -r ."sys"."country")

#Displayinh weather details

echo "--------------------------------------------"
echo "      Weather Details of ${city}            "
echo "--------------------------------------------"


echo "Temperature: ${temp}°C"
echo "Feels like: ${feelsLike}°C"
echo "Humidity: ${humidity}%"
echo "It is currently ${weather}"





