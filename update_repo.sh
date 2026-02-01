#!/bin/bash

GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'

echo "Starting repository update..."

if [ -d "rpm" ]; then
    echo -e "${GREEN}RPM folder found. Generating repo metadata...${NC}"
    if command -v createrepo_c &> /dev/null; then
        createrepo_c rpm/
        echo -e "${GREEN}RPM repo updated.${NC}"
    elif command -v createrepo &> /dev/null; then
        createrepo rpm/
        echo -e "${GREEN}RPM repo updated.${NC}"
    else
        echo -e "${RED}ERROR: 'createrepo_c' or 'createrepo' command not found. Please install it (e.g., sudo pacman -S createrepo_c).${NC}"
    fi
else
    echo "RPM folder not found, skipping."
fi

if [ -d "deb" ]; then
    echo -e "${GREEN}DEB folder found. Generating repo metadata...${NC}"
    if command -v dpkg-scanpackages &> /dev/null; then
        cd deb
        dpkg-scanpackages . /dev/null > Packages
        gzip -k -f Packages
        
        echo "Origin: Taygun Repo" > Release
        echo "Label: TaygunRepo" >> Release
        echo "Suite: stable" >> Release
        echo "Codename: stable" >> Release
        echo "Architectures: amd64" >> Release
        echo "Components: main" >> Release
        echo "Description: Taygun's Personal Repository" >> Release
        echo "Date: $(date -R)" >> Release
        
        cd ..
        echo -e "${GREEN}DEB repo updated.${NC}"
    else
        echo -e "${RED}ERROR: 'dpkg-scanpackages' command not found. Please install 'dpkg' (e.g., sudo pacman -S dpkg).${NC}"
    fi
else
    echo "DEB folder not found, skipping."
fi

echo "Process completed."
