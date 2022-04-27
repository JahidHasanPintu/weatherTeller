#!/bin/bash
#Written by Jahid Hasan Pintu

echo "--------------------------------------------"
echo "             --- Weather APP---             "
echo "                  by                          "
echo "       Md. Jahid Hasan Pintu and Parvez Mosharof"
echo "--------------------------------------------"



while true
do

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

if [ -z "$temp" ]
then
      	echo "--------------------------------------------"
	echo "      ${city} is not a Valid City            "
	echo "--------------------------------------------"

else
      	echo "--------------------------------------------"
	echo "      Weather Details of ${city}            "
	echo "--------------------------------------------"

	echo "Temperature: ${temp}°C"
	echo "Feels like: ${feelsLike}°C"
	echo "Humidity: ${humidity}%"
	echo "It is currently ${weather}"

fi
	echo ""
	echo "Press [CTRL+C] to stop.."
	echo "__________________________________________"
	echo "  "
	sleep 1

	
done
