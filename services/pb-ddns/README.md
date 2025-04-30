## Overview

This script polls your current public IP and updates A records on Porkbun DNS for multiple subdomains. It only pushes updates when the IP changes, reducing redundant API calls.

### Disclamier

- This is not a general-purpose DDNS client.
- It will not work without an active Porkbun account and valid API credentials.
- Intended for personal setups without a static IP, use at your own discretion.

## Requirements

- A registered domain through [Porkbun](https://porkbun.com)
- Porkbun API key and secret key
- A `.env` file (`cp .env.example .env`) with the following required variables:

```bash
API_KEY=your_porkbun_api_key
SECRET_KEY=your_porkbun_secret_key
DOMAIN=example.site
SUBDOMAIN=anything
LOG_FILE_PATH=/absolute/path/to/ddns.log
LAST_IP_FILE_PATH=/absolute/path/to/last_ip.txt
```

## Usage

1. Place the script in a persistent location with correct permissions

2. Ensure the script is executable:
```bash
chmod +x pb-ddns.sh
```

3. Set up a cronjob to execute it periodically, e.g. every 30 minutes:
```bash
*/30 * * * * /path/to/your/script/update-ddns.sh >> /path/to/your/logs/ddns.log 2>&1
```

4. Make sure the user running the cronjob has write access to the log
