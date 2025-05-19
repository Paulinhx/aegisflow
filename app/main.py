from flask import Flask, request
import pickle, subprocess

app = Flask(__name__)

@app.route("/")
def home():
    return "Welcome to AegisFlow"

@app.route("/eval", methods=["POST"])
def eval_input():
    return eval(request.form.get("code"))  # ❌ Eval injection

@app.route("/pickle", methods=["POST"])
def load_pickle():
    return pickle.loads(request.data)  # ❌ Insecure deserialization

@app.route("/shell", methods=["POST"])
def exec_shell():
    return subprocess.call(request.form.get("cmd"), shell=True)  # ❌ Shell injection
