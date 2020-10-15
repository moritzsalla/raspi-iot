'''
API that makes it possible to interact
with Wekinator.
'''
from sense_hat import SenseHat
from flask import Flask, request, jsonify

import test

sense = SenseHat()
app = Flask(__name__)

@app.route("/")
def hello():
    return'''<h1>Server Online</h1><br />
    <p>Example query: /sentiment?val=2.3</p>'''

@app.route('/sentiment')
def handle_data():
    val = request.args.get('val')
    val = float(val)
    sense.clear(val, val, val)
    return '''<h1>Sentiment: {}</h1>'''.format(val)