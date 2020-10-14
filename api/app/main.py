'''
API that makes it possible to interact
with Wekinator.
'''

from typing import Optional
from fastapi import FastAPI
from sense_hat import SenseHat

app = FastAPI()
sense = SenseHat()

class User():
      sentiment: float

@app.get("/")
def read_root():
      return {"Server": "Online!"}

sense.clear(50, 100, 0)

@app.get("/items/{item_id}")
def read_item(item_id: int, q: Optional[str] = None):
      User.sentiment = float(item_id)
      
      print(sense)
      sense.clear(255,255,255)
      
      result = {"item_id": item_id, "q": q}
      return result