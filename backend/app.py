from flask import Flask, jsonify

app = Flask(__name__)

@app.route("/")
def home():
    return jsonify({
        "message": "Employee Management Backend",
        "status": "running"
    })

@app.route("/employees")
def employees():
    return jsonify([
        {"id": 1, "name": "Bavajan", "role": "DevOps Engineer"},
        {"id": 2, "name": "Employee 2", "role": "Cloud Engineer"}
    ])

@app.route("/health")
def health():
    return jsonify({"status": "healthy"})

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)