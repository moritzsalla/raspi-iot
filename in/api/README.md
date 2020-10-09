API that receives POST request and sends data to wekinator via osc

To run:  
`pipenv run uvicorn main:app --reload`

Example query:  
`http://127.0.0.1:8000/items/5?q=somequery`