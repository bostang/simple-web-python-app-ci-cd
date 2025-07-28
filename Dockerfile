# Dockerfile
# Menggunakan image dasar Python yang ringan
FROM python:3.9-slim-buster

# Menetapkan direktori kerja di dalam container
WORKDIR /app

# Menyalin file requirements.txt ke direktori kerja
COPY requirements.txt .

# Menginstal dependensi Python
RUN pip install --no-cache-dir -r requirements.txt

# Menyalin seluruh aplikasi ke direktori kerja
COPY . .

# Mengekspos port 8080 yang digunakan oleh aplikasi Flask
EXPOSE 8080

# Mendefinisikan perintah untuk menjalankan aplikasi saat container dimulai
CMD ["python", "app.py"]

