from flask import Flask
from prometheus_flask_exporter import PrometheusMetrics

app = Flask(__name__)
metrics = PrometheusMetrics(app)

@app.route('/')
def hello():
    return '<h1>Hello, World!</h1></br><h3>tech task</h3>'

@app.route('/')
def metrics():
    return 'OK'