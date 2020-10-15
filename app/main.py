'''
API that makes it possible to interact
with Wekinator.
'''
# from sense_hat import SenseHat
from flask import Flask 
# import test

# sense = SenseHat()
app = Flask(__name__)

@app.route("/")
def hello():
    return "Server online"

@app.route('/foo', methods=['POST']) 
def foo():
    data = app.request.json
    return jsonify(data)