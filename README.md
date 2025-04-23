Fortran BruteForce Tool(ciddiyim.)

# 🔐 ForceForge

DİSCLAIMER:OLACAKLARDAN SORUMLU DEĞİLİM!
BAŞINIZA GELECEKLERDEN SORUMLU DEĞİLİM!

**ForceForge**, Fortran + C diliyle yazılmış sade, hızlı ve etkili bir terminal tabanlı güvenlik aracıdır.  
Kullanıcıya iki güçlü özellik sunar:

1. 🔓 Hash Cracker (MD5 - wordlist tabanlı)
2. 🔑 SSH Brute-Force Tool (libssh destekli, C üzerinden tetiklenen)

---

## 🚀 Özellikler

- Wordlist tabanlı MD5 hash kırma
- SSH brute-force saldırısı (libssh ile doğrudan bağlantı testi)
- Hızlı, terminal odaklı
- Tamamen açık kaynak
- C ve Fortran uyumlu hibrit yapı

---

## 🧰 Gereksinimler

- `gfortran` (Fortran derleyicisi)
- `gcc` (C derleyicisi)
- `libssh-dev` (SSH bağlantısı için)
- Linux/macOS (Windows uyarlaması manuel yapılabilir)

# Disclaimer!(Sorumluluk Reddi Beyanı)
Başınıza geleceklerden ve yaptıklarınızın sorumluluklarını almadığımı bildirmek isterim.

### Debian/Ubuntu için kurulum:
```bash
sudo apt update
sudo apt install gfortran gcc libssh-dev
gcc ssh_try.c -o ssh_try -lssh
gfortran main_tool.f90 -o forceforge

