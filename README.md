# Taygun86 Repository

This repository hosts personal RPM and DEB packages.

## Installation / Usage

### Debian / Ubuntu

Run the following command to add the repository:

```bash
echo "deb [trusted=yes] https://taygun86.github.io/taygun86-repo/deb ./" | sudo tee /etc/apt/sources.list.d/taygun86.list
sudo apt update
```

**Install Package:**
```bash
sudo apt install zapret-gtk
```

---

### Fedora / RHEL

Run the following command to add the repository:

```bash
sudo tee /etc/yum.repos.d/taygun86.repo <<EOF
[taygun86]
name=Taygun86 Repository
baseurl=https://taygun86.github.io/taygun86-repo/rpm
enabled=1
gpgcheck=0
EOF
```

**Install Package:**
```bash
sudo dnf install zapret-gtk
```
