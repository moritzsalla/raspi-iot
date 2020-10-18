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

@app.route('/sentiment')
def handle_data():
    val = request.args.get('val')
    val = int(val)
    sense.clear(val, val, val)
    return '''Sentiment: {}'''.format(val)

if __name__ == '__main__':
    app.run(debug=False, port=80, host='0.0.0.0')
