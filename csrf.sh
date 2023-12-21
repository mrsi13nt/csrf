#!/bin/bash

echo "hello, friend"
echo "[1] scan list of subdomains
[2] scan list of main domains
[3] scan one subdomain
[4] scan one main domain"
pick=0
read -p ">> " pick

if [[ $pick == "1" ]] || [[ $pick == 1 ]]; then
    read -p "enter list of subdomains: " file_path
    if [ -e "$file_path" ]; then
        cat "$file_path" | httpx -o alive.txt && cat alive.txt | gau | waybackurls | hakrawler -d 2  >> urls.txt && cat urls.txt | kxss | grep -E 'CSRF|csrf|token|TOKEN|anti-csrf|Anti-CSRF|anticsrf|AntiCSRF'
    else
        echo "File not found: $file_path"
    fi
elif [[ $pick == "2" ]] || [[ $pick == 2 ]]; then
    read -p "enter list of main domains: " file_path2
    if [ -e "$file_path2" ]; then
        subfinder -l "$file_path2" | httpx -o alive.txt && cat alive.txt | gau | waybackurls | hakrawler -d 2  >> urls.txt && cat urls.txt | kxss | grep -E 'CSRF|csrf|token|TOKEN|anti-csrf|Anti-CSRF|anticsrf|AntiCSRF'
    else
        echo "File not found: $file_path2"
    fi
elif [[ $pick == "3" ]] || [[ $pick == 3 ]]; then
    read -p "enter subdomain: " subdomain
    cat "$subdomain" | httpx -o alive.txt && cat alive.txt | gau | waybackurls | hakrawler -d 2  >> urls.txt && cat urls.txt | kxss | grep -E 'CSRF|csrf|token|TOKEN|anti-csrf|Anti-CSRF|anticsrf|AntiCSRF'
elif [[ $pick == "4" ]] || [[ $pick == 4 ]]; then
    read -p "enter the main domain: " domain
    subfinder -d "$domain" | httpx -o alive.txt && cat alive.txt | gau | waybackurls | hakrawler -d 2  >> urls.txt && cat urls.txt | kxss | grep -E 'CSRF|csrf|token|TOKEN|anti-csrf|Anti-CSRF|anticsrf|AntiCSRF'
fi

#made by Mr Si13nt