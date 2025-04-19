I built a global music streaming server on a Raspberry Pi 5 using DietPi, Docker, and Nginx, turning a USB drive into a secure, web-accessible music library. This project blends Linux sysadmin skills (headless setup, SSH hardening, firewall) with web development (custom domain, reverse proxy and upcoming web interface), streaming tunes anywhere via orbita.website. I’m currently writing a detailed devlog, testing replicable solutions, and preparing to release all scripts and configs on GitHub.

This repository hosts docker compose files for services along with their .env example files. In order to use them for your own self-hosting, do the following:
1. 'cp .env.example .env'
2. Fill out the environment file
3. Done!

#### Note for navidrome config
The navidrome .env file contains some navidrome-specific settings that I used for my project. You can choose to ignore them or add more, all possible configs can be found [here](https://www.navidrome.org/docs/usage/configuration-options/)

#### Note for pb-ddns
The pb-ddns .env file contains some [porkbun](https://porkbun.com/) specific settings that I used for my project. If you have a domain registered from a different service, follow their documentation. 'update-dns' is just a hacky script for automatically updating the IP address of the server through Porkbun's API service.

