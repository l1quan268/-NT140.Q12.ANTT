# Hướng dẫn cài đặt, chạy dự án SWEETHOME trên localhost

## 1. Clone repo về máy
```bash
git clone https://github.com/l1quan268/-NT140.Q12.ANTT.git
cd ./-NT140.Q12.ANTT
```

## 2. Cài đặt Node.js & npm (nếu chưa có)
```bash
sudo apt update
sudo apt install nodejs npm
```

## 3. Cài đặt MySQL Server
```bash
sudo apt install mysql-server
sudo systemctl start mysql
```

## 4. Import database
```bash
mysql -u root -p
# Nhập password MySQL
CREATE DATABASE booking_db;
USE booking_db;
SOURCE sweethome_24_5_2025.sql;
EXIT;
```

## 5. Cài đặt các package Node
```bash
npm install
```

## 6. Tạo file .env với thông tin kết nối MySQL (KHÔNG push lên GitHub)
```bash
cat > .env <<EOF
DB_HOST=127.0.0.1
DB_PORT=3306
DB_USER=root
DB_PASS=your_mysql_password
DB_NAME=booking_db
EOF
```
**Thay `your_mysql_password` bằng mật khẩu MySQL của bạn.**

## 7. Chạy dự án
```bash
npm start
```
Truy cập trang web tại: [http://localhost:3000](http://localhost:3000)

---

## Tài khoản đăng nhập mẫu

Sau khi import database, các thành viên có thể dùng các tài khoản sau để đăng nhập:

### Quản trị viên (Admin)
- **Email:** admin@sweethome.com
- **Mật khẩu:** admin

### Người dùng (User)  
Dùng một trong các email sau (mật khẩu giống nhau):
- **Email:** eteo784@gmail.com
- **Email:** ngtai2004vl@gmail.com
- **Email:** xinchao@gm
- **Email:** 23521265@gm.uit.edu.vn
- **Email:** SantrongSang@gm
- **Mật khẩu:** user123

(Xem chi tiết trong file sweethome_24_5_2025.sql)

---

## Lưu ý:
- Nếu MySQL chạy trên máy khác hoặc port khác, hãy chỉnh lại thông tin trong file `.env`.
- Nếu gặp lỗi thiếu package, chạy lại `npm install`.
- Không push file `.env` lên GitHub để tránh lộ thông tin bảo mật!

## Cần hỗ trợ?  
Liên hệ chủ repo: l1quan268
