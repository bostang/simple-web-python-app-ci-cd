# app.py
from flask import Flask

app = Flask(__name__)

@app.route('/')
def hello():
    """
    Rute utama yang mengembalikan pesan 'Hello, Kubernetes!'.
    """
    return "Hello, Kubernetes! Ini adalah aplikasi Python sederhana Anda."

if __name__ == '__main__':
    # Menjalankan aplikasi di semua interface yang tersedia pada port 8080.
    # Ini penting untuk deployment di container.
    app.run(debug=True, host='0.0.0.0', port=8080)

