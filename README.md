# Saucedemo Automation Testing with Robot Framework

Proyek ini merupakan automation testing untuk website **Saucedemo** (https://www.saucedemo.com/v1/) menggunakan **Robot Framework** dan **SeleniumLibrary**.

## 📌 Fitur
- Pengujian otomatis pada halaman login, inventory, cart, dan checkout.
- Menggunakan **Robot Framework** dan **SeleniumLibrary**.
- Menghasilkan laporan otomatis dalam format **HTML** dan **XML**.

# 🚀 Cara Menjalankan Testing

### 1. Clone repository ini
```bash
git clone https://github.com/Munn15/Saucedemo-Automation-RobotFramework.git
cd Saucedemo-Automation-RobotFramework
```

### 2. Install dependencies
```bash 
pip install -r requirements.txt
```

### 3. Jalankan testing
```bash
robot -d results tests/
```

### 4. Melihat hasil testing
Buka laporan hasil testing dengan membuka file berikut di browser:
- log.html
- report.html
