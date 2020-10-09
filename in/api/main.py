'''
API that makes it possible to interact
with Wekinator.
'''

from typing import Optional
from fastapi import FastAPI
import wekinator

app = FastAPI()

class User():
      sentiment: float

@app.get("/")
def read_root():
      return {"Server": "Online"}


@app.get("/items/{item_id}")
def read_item(item_id: int, q: Optional[str] = None):
      User.sentiment = float(item_id)
      wekinator.sendVal(User.sentiment)
      
      result = {"item_id": item_id, "q": q}
      return result