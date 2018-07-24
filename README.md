# Quick start




# Build from source ( Docker )

```
git clone https://github.com/adik/nginx-brotli-tls1.3
git submodule update --init
```


Create and run image: 
```
docker build . --tag nginx-builder
docker run -v $(pwd)/debian:/root/src/debian -v $(pwd)/openssl_1.1.1:/root/src/openssl_1.1.1 -it nginx-builder
```

**Precompile OpenSSL**
```
git submodule update --init
cd openssl_1.1.1/
./config --prefix=../debian/openssl_1.1.1/.openssl no-shared no-threads
make && make install_sw LIBDIR=lib
```

**Build nginx**
```
cd src/
wget https://launchpad.net/~nginx/+archive/ubuntu/development/+sourcefiles/nginx/1.15.0-0+xenial0/nginx_1.15.0.orig.tar.gz
tar xzvf nginx_1.15.0.orig.tar.gz
cp -av debian nginx-1.15.0/
cd nginx-1.15.0/
```

### build package sources

**update revision**
```
dch -i
```

**include source file:**
```
dpkg-buildpackage -S -sa -k<keyid>
```

OR

**do not include source file:**
```
dpkg-buildpackage -S -sd -k<keyid>
```

# Upload to ppa
```
dput ppa:smirnov-arkady/ubuntu-backports <source.changes>
```
