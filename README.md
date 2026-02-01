# Taygun86 Repository

This repository hosts personal RPM and DEB packages.

## Updating the Repository (Developer)

After adding new packages, run the following script to update the metadata files:

```bash
./update_repo.sh
```

**Requirements:**
- For RPM: `createrepo` (or `createrepo_c`)
- For DEB: `dpkg-dev` (for `dpkg-scanpackages` command)

---

## Usage (Client)

Follow the steps below to add this repository to your system. (Note: If this repo is hosted online, replace the URL with your server address. You can use the `file://` protocol for local usage).

### Fedora / RHEL / CentOS (RPM)

Create the file `/etc/yum.repos.d/taygun86.repo`:

```ini
[taygun86]
name=Taygun86 Repository
baseurl=https://taygun86.github.io/taygun86-repo/rpm
enabled=1
gpgcheck=0
```
*(Note: Replace the `baseurl` field with your repository's actual address. The address above assumes Github Pages is used.)*

### Debian / Ubuntu (DEB)

Create the file `/etc/apt/sources.list.d/taygun86.list`:

```list
deb [trusted=yes] https://taygun86.github.io/taygun86-repo/deb ./
```

*(Note: The `[trusted=yes]` flag is required to use repositories without GPG signatures.)*

Then update the package list:

```bash
sudo apt update
```
