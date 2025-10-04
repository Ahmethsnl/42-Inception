# 🐳 Inception Project - Docker Infrastructure

Bu proje 42 School Inception projesidir. Docker teknolojisi kullanarak NGINX, WordPress ve MariaDB servislerinden oluşan güvenli bir web altyapısı kurmayı amaçlar.

## 📋 Proje Gereksinimleri

- ✅ 3 ayrı Docker container (NGINX, WordPress, MariaDB)
- ✅ Custom Dockerfile'lar (hazır image kullanılmaz)
- ✅ TLS 1.2/1.3 SSL güvenliği
- ✅ Environment variables ile konfigürasyon
- ✅ Docker Compose orkestrasyon
- ✅ Persistent data storage
- ✅ Container restart policies
- ✅ Docker network isolation

## 🏗️ Proje Yapısı

```
Inception/
├── Makefile
├── secrets/
│   ├── credentials.txt
│   ├── db_password.txt
│   └── db_root_password.txt
└── srcs/
    ├── docker-compose.yml
    ├── .env
    └── requirements/
        ├── mariadb/
        │   ├── Dockerfile
        │   ├── .dockerignore
        │   ├── conf/
        │   │   └── my.cnf
        │   └── tools/
        │       └── mariadb.sh
        ├── nginx/
        │   ├── Dockerfile
        │   ├── .dockerignore
        │   ├── conf/
        │   │   └── nginx.conf
        │   └── tools/
        │       └── nginx.sh
        └── wordpress/
            ├── Dockerfile
            ├── .dockerignore
            ├── conf/
            │   └── www.conf
            └── tools/
                └── create_wordpress.sh
```

## 🚀 Kurulum

### 1. Repository'yi klonlayın:
```bash
git clone https://github.com/Ahmethsnl/Inception.git
cd Inception
```

### 2. Konfigürasyon dosyalarını hazırlayın:
```bash
# Environment variables dosyasını oluşturun
cp srcs/.env.example srcs/.env
# Kendi bilgilerinizle düzenleyin

# Secrets dosyalarını oluşturun  
cp -r secrets.example secrets
# Kendi şifrelerinizle düzenleyin

# Makefile'ı kopyalayın
cp Makefile.example Makefile
# your_login kısmını kendi login'inizle değiştirin

# Docker-compose'u kopyalayın
cp srcs/docker-compose.yml.example srcs/docker-compose.yml
# your_login kısmını kendi login'inizle değiştirin
```

### 3. Hosts dosyanızı düzenleyin:
**Windows:** `C:\Windows\System32\drivers\etc\hosts`
**Linux/Mac:** `/etc/hosts`
```
127.0.0.1 your_login.42.fr
```

### 4. Data klasörlerini oluşturun:
```bash
# Windows
mkdir "C:\your_login\data\wordpress"
mkdir "C:\your_login\data\mysql"

# Linux/Mac  
mkdir -p /home/your_login/data/wordpress
mkdir -p /home/your_login/data/mysql
```

### 5. Projeyi başlatın:
```bash
make
```

## 🌐 Kullanım

### Web Sitesi Erişimi:
- **Ana sayfa:** `https://your_login.42.fr`
- **Admin paneli:** `https://your_login.42.fr/wp-admin`

### Docker Yönetimi:
- **Başlat:** `make`
- **Durdur:** `make down` 
- **Yeniden başlat:** `make re`
- **Temizle:** `make clean`

### Giriş Bilgileri:
`.env` dosyasında tanımladığınız kullanıcı adı ve şifrelerle giriş yapabilirsiniz.

## Servisler

- **NGINX**: TLS 1.2/1.3 ile SSL terminasyonu, port 443
- **WordPress**: PHP-FPM ile WordPress kurulumu
- **MariaDB**: MySQL veritabanı servisi

## 🔐 Güvenlik Özellikleri

- ✅ **Environment Variables:** Hassas bilgiler .env dosyasında
- ✅ **SSL/TLS:** Otomatik self-signed sertifika oluşturma
- ✅ **Admin Güvenlik:** Admin username'de 'admin' kelimesi yok
- ✅ **Network İzolasyonu:** Container'lar özel network'te
- ✅ **Port Güvenliği:** Sadece 443 portu dışarıya açık
- ✅ **Şifre Yönetimi:** Dockerfile'larda şifre bulunmaz

## ⚠️ Önemli Notlar

- **Secrets klasörü** git'e commit edilmez
- **.env dosyası** git'e commit edilmez  
- **Example dosyalar** referans amaçlıdır
- **Hosts dosyası** manuel olarak düzenlenmelidir
- **SSL uyarısı** self-signed sertifika nedeniyle normaldir

## 🛠️ Teknik Detaylar

### Container'lar:
- **NGINX:** Debian Bullseye + SSL termination
- **WordPress:** Debian Bullseye + PHP 8.1 + PHP-FPM  
- **MariaDB:** Debian Bullseye + MySQL database

### Network:
- **Bridge Network:** Container'lar arası iletişim
- **Internal Communication:** NGINX → WordPress → MariaDB
- **External Access:** Sadece NGINX (443 portu)

### Volumes:
- **WordPress Data:** `/var/www/html` persistent storage
- **MariaDB Data:** `/var/lib/mysql` persistent storage

## 📚 42 School Gereksinimleri

Bu proje 42 School Inception projesinin tüm gereksinimlerini karşılar:
- [x] Docker Compose kullanımı
- [x] Custom Dockerfile'lar  
- [x] TLS 1.2/1.3 protokolleri
- [x] Environment variables
- [x] Volume management
- [x] Network configuration
- [x] Container restart policies
- [x] Security best practices