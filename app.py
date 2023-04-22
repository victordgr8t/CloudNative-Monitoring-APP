import psutil
# render - add style in flask application
from flask import Flask, render_template

app = Flask(__name__)


@app.route("/")
def index():
    cpuGauge = psutil.cpu_percent()
    memGauge = psutil.virtual_memory().percent
    Message = None
    if cpuGauge > 80 or memGauge > 80:
        Message = " High CPU or Memory utilization detected. Please scale up"
    return render_template("index.html", cpu_metric=cpuGauge, mem_metric=memGauge, message=Message)


if __name__ == "__main__":
    app.run(debug=True, host='0.0.0.0')
