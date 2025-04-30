## Overview

This script polls your current public IP and updates A records on Porkbun DNS for multiple subdomains. It only pushes updates when the IP changes, reducing redundant API calls.

## Requirements

- A registered domain through [Porkbun](https://porkbun.com)
- Porkbun API key and secret key
- A `.env` file (`cp .env.example .env`) with the following required variables:

```bash
API_KEY=your_porkbun_api_key
SECRET_KEY=your_porkbun_secret_key
DOMAIN=example.com
SUBDOMAIN=anything
LOG_FILE=/absolute/path/to/ddns.log
LAST_IP_FILE=/absolute/path/to/last_ip.txt
