'''
API that makes it possible to interact
with Wekinator.
'''
from sense_hat import SenseHat
from flask import Flask, request, jsonify
import tests

sense = SenseHat()
app = Flask(__name__)

@app.route("/")
def hello():
    return "Server Online. Example query: /sentiment?val=200"

@app.route('/test')
def run_tests():
	tests.matrix()
	return "Running tests"

@app.route('/color')
def set_color():
    r = request.args.get('r')
    g = request.args.get('g')
    b = request.args.get('b')
    r = int(r)
    g = int(g)
    b = int(b)
    sense.clear(r, g, b)
    return '''R: {r}<br />G: {g}<br />B: {b}'''.format(r, g, b)

if __name__ == '__main__':
    app.run(debug=False, port=80, host='0.0.0.0')
