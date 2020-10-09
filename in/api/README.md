API that receives POST request and sends data to wekinator via osc

To install docker environment:  
```
docker build -t myimage .
```

To run:  
```
docker run -d --name mycontainer -p 80:80 myimage

# to run in dev mode (without docker)
uvicorn main:app --reload
```

Example query:  
```
http://127.0.0.1:8000/items/5?q=somequery
```

More information about deploying fastAPI on Raspi: https://fastapi.tiangolo.com/deployment/

## To–Do
- [ ] Add functionality to control wekinator via OSC, ex. retrain every time data is received.
- [ ] Clean up get requests
- [ ] Fix: wekiantor isn't receiving input on Wek
