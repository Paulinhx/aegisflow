from flask import Flask, request
import pickle, subprocess, ast

app = Flask(__name__)

@app.route("/")
def home():
    return "Welcome to AegisFlow"

@app.route("/eval", methods=["POST"])
def eval_input():
    return ast.literal_eval(request.form.get("code"))  # Fixed eval injection

@app.route("/pickle", methods=["POST"])
def load_pickle():
    return pickle.loads(request.data)  # ❌ Insecure deserialization

@app.route("/shell", methods=["POST"])
def exec_shell():
    return subprocess.call(request.form.get("cmd"), shell=True)  # ❌ Shell injection
