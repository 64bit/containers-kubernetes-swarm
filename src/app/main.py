from flask import Flask, send_file
import socket

app = Flask(__name__)

@app.route("/hello")
def hello():
  print(socket.gethostname())    
  return "<style> .center {    padding: 70px 0;    border: 3px solid blue;    text-align: center;}</style> <div class='center' > <h1 > Thank You Dr. Fawcett for Distributed Objects! </h1> <div>I'm serving you from container: </div> <h2>" + socket.gethostname() + "</h2> <br> <img src='https://media.giphy.com/media/mifVgeHNqxdDy/giphy.gif'/> </div>"

@app.route("/")
def main():
    return send_file('./static/index.html')

if __name__ == "__main__":
    app.run(host='0.0.0.0', debug=True, port=80)
