# API provider: openweathermap.org
# Find your coordinates here: latlong.net

import requests
import json

def fetch():
      api_key = "27cae45daf4cddb44b8982c70c14848a"
      lat = "48.208176"
      lon = "16.373819"
      url = (
      "https://api.openweathermap.org/data/2.5/onecall?lat=%s&lon=%s&appid=%s&units=metric"
      % (lat, lon, api_key)
      )

      response = requests.get(url)
      data = json.loads(response.text)
      val = data["current"]["temp"]

      return val
