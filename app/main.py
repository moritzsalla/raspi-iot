'''
API that makes it possible to interact
with Wekinator.
'''
from sense_hat import SenseHat
from flask import Flask, request, jsonify
from flask_cors import CORS
import tests

sense = SenseHat()
app = Flask(__name__)
CORS(app)

@app.route("/")
def hello():
    return "Server Online. Example query: /color?r=120&g=120&b=120"

@app.route('/test')
def run_tests():
	tests.matrix()
	return "Running tests"

@app.route('/color')
def set_color():
    args = request.args.to_dict()
    sense.clear(int(args["r"]), int(args["g"]), int(args["b"]))
    return args

if __name__ == '__main__':
    app.run(debug=True, port=80, host='0.0.0.0')
