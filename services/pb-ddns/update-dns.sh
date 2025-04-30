#!/bin/bash

if [ -f .env ]; then
  export $(grep -v '^#' .env | xargs)
fi

mkdir -p "$(dirname "$LOG_FILE")"

log() {
  echo "$(date '+%Y-%m-%d %H:%M:%S') - $1" >> "$LOG_FILE"
}

CURRENT_IP=$(curl -s https://api.ipify.org)
log "Polled IP: $CURRENT_IP"

if [[ -f "$LAST_IP_FILE" ]]; then
  LAST_IP=$(<"$LAST_IP_FILE")
  if [[ "$CURRENT_IP" == "$LAST_IP" ]]; then
    exit 0
  fi
fi

echo "$CURRENT_IP" > "$LAST_IP_FILE"

cat > /tmp/porkbun-data.json << EOF
{
  "apikey": "$API_KEY",
  "secretapikey": "$SECRET_KEY",
  "content": "$CURRENT_IP",
  "ttl": "600"
}
EOF

RESPONSE_ROOT=$(curl -s -X POST "https://api.porkbun.com/api/json/v3/dns/editByNameType/$DOMAIN/A/" \
  -H "Content-Type: application/json" \
  -d @/tmp/porkbun-data.json)
log "Root domain API Response: $RESPONSE_ROOT"

RESPONSE_SUB=$(curl -s -X POST "https://api.porkbun.com/api/json/v3/dns/editByNameType/$DOMAIN/A/$SUBDOMAIN" \
  -H "Content-Type: application/json" \
  -d @/tmp/porkbun-data.json)
log "Subdomain API Response: $RESPONSE_SUB"

rm /tmp/porkbun-data.json
