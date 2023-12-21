#!/bin/bash

#installing main pkg
sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get install golang -y

#installing tools
go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest
sudo apt install hakrawler -y
go install -v github.com/lc/gau/v2/cmd/gau@latest
go install -v github.com/tomnomnom/waybackurls@latest
go get github.com/Emoe/kxss
sudo cp /root/go/bin/kxss /usr/local/go/bin/

#nice scan :)
#made by Mr Si13nt