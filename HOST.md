# Hướng dẫn cài đặt và sử dụng `ngrok` để host web trên Internet

## 1. Cài đặt `ngrok`
Mở Terminal trên **Ubuntu** và chạy các lệnh sau:

```bash
# 1. Thêm khóa GPG của ngrok
curl -s https://ngrok-agent.s3.amazonaws.com/ngrok.asc | \
  sudo tee /etc/apt/trusted.gpg.d/ngrok.asc >/dev/null

# 2. Thêm kho lưu trữ (repository) của ngrok
echo "deb https://ngrok-agent.s3.amazonaws.com buster main" | \
  sudo tee /etc/apt/sources.list.d/ngrok.list

# 3. Cập nhật danh sách gói và cài đặt ngrok
sudo apt update
sudo apt install ngrok
```

---

## 2. Liên kết tài khoản (Authtoken)

Truy cập trang [ngrok dashboard](https://dashboard.ngrok.com/get-started/your-authtoken) và đăng nhập. Sau đó, sao chép mã Authtoken của bạn.

Quay lại Terminal và chạy lệnh sau (thay `<TOKEN_CỦA_BẠN>` bằng mã Authtoken bạn vừa sao chép):

```bash
ngrok config add-authtoken <TOKEN_CỦA_BẠN>
```

---

## 3. Khởi chạy đường hầm `ngrok`

Đảm bảo ứng dụng web của bạn đang chạy (ví dụ: `npm start`) trong một Terminal.

Ở một Terminal khác, chạy lệnh sau để khởi chạy đường hầm ngrok:

```bash
ngrok http 3000
```

---

## 4. Lấy link chia sẻ

Khi chạy lệnh trên, Terminal sẽ hiển thị một giao diện trạng thái. Đường link công khai có thể được tìm thấy ở dòng `Forwarding`, ví dụ:

```
ngrok                                  (Ctrl+C to quit)

Session Status                online
...
Forwarding                    https://<ten-ngau-nhien>.ngrok-free.dev -> http://localhost:3000
...
```

Truy cập vào link `https://<ten-ngau-nhien>.ngrok-free.dev` để có thể truy cập ứng dụng web của nhóm.

---

## Lưu ý:
- Link được cung cấp bởi `ngrok` chỉ hoạt động trong thời gian ngắn. Để duy trì, bạn cần đảm bảo ngrok đang chạy và có kết nối mạng.
- Nếu cần host web trên một port khác, thay `3000` bằng port của ứng dụng web đang chạy.

---

## Cần hỗ trợ?  
Liên hệ chủ repo: l1quan268
