# geoDevice
            _____ 
          .-'.  ':'-.
        .''::: .:    '. GeoDevice
       /   :::::'      \  Device Tracker
      ;.    :;'         ;
      |       '..       |
      ; '      ::::.    ;
       \       '::::   /
        '.      :::  .'
          '-.___'_.-' 

* Prerequisite
```
 # download and configure ngrok (sign up if not)
 # 64 bit
 wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip
 # 32 bit
 wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-386.zip
 unzip ngrok-stable-linux*
 rm ngrok-stable-linux*
 mv ngrok /usr/bin
./ngrok authtoken <authtoken>
```
* Usage
```
sudo bash geoDevice.sh
```
* Additional Notes
```
The Latitude and Longitude of the target will be displayed under the HTTP Request on NGROK tab.
Manually type the lat & lon, or copy the coordinates from http://127.0.0.1/inspect/http
```
