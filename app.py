#!/usr/bin/env python3
from flask import Flask

app = Flask(__name__)


@app.route('/')
def hello_world():  # put application's code here
    return 'Hello World! \n Test Test! 吊不吊吊不吊!!!!说话！！！！'


if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
