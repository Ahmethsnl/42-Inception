# Inception Project

Bu proje Docker teknolojisi kullanarak NGINX, WordPress ve MariaDB servislerinden oluşan bir web altyapısı kurmayı amaçlar.

## Proje Yapısı

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

## Kurulum

1. Hosts dosyanızı düzenleyin (Windows: C:\Windows\System32\drivers\etc\hosts):
   ```
   127.0.0.1 ahmsanli.42.fr
   ```

2. Data klasörlerini oluşturun:
   ```cmd
   mkdir "C:\ahmsanli\data\wordpress"
   mkdir "C:\ahmsanli\data\mysql"
   ```

3. Projeyi başlatın:
   ```bash
   make
   ```

## Kullanım

- WordPress sitesine erişmek için: https://ahmsanli.42.fr
- Projeyi durdurmak için: `make down`
- Projeyi yeniden başlatmak için: `make re`
- Temizlemek için: `make clean`

## Servisler

- **NGINX**: TLS 1.2/1.3 ile SSL terminasyonu, port 443
- **WordPress**: PHP-FPM ile WordPress kurulumu
- **MariaDB**: MySQL veritabanı servisi

## Güvenlik

- Tüm şifreler environment variables olarak saklanır
- SSL sertifikaları otomatik olarak oluşturulur
- Admin kullanıcısı adında 'admin' kelimesi bulunmaz