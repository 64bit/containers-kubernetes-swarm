from flask import Flask, send_file
import socket

app = Flask(__name__)

@app.route("/hello")
def hello():
  print(socket.gethostname())    
  return "Hello Himanshu, I'm serving you from container " + socket.gethostname()

@app.route("/")
def main():
    return send_file('./static/index.html')

if __name__ == "__main__":
    app.run(host='0.0.0.0', debug=True, port=80)
