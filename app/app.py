from flask import Flask, render_template
from flask_socketio import SocketIO, send
import json

app = Flask(__name__)
socketio = SocketIO(app)

@app.route('/')
def index():
    return render_template('index.html')

@socketio.on('message')
def handle_message(msg):
    data = json.loads(msg)
    print(data)
    send(json.dumps(data), broadcast=True)

if __name__ == '__main__':
    socketio.run(app, host='0.0.0.0', port=5000)