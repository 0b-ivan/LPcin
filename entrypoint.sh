#!/bin/sh
set -e

OUTPUT_DIR=/usr/share/nginx/html
mkdir -p "$OUTPUT_DIR"

# Defaults for optional variables
: "${SITE_TITLE:=Rechtliche Hinweise}"
: "${COMPANY_NAME:=Meine Firma}"
: "${CONTACT_EMAIL:=kontakt@example.com}"
: "${COMPANY_ADDRESS:=Musterstraße 1, 12345 Berlin, Deutschland}"
: "${MANAGING_DIRECTOR:=Max Mustermann}"
: "${WEBSITE_URL:=https://example.com}"
: "${DATA_CONTROLLER:=Meine Firma}"
: "${DPO_CONTACT:=Nicht benannt}"
: "${HOSTING_PROVIDER:=Eigene Infrastruktur}"
: "${HOSTING_LOCATION:=Deutschland}"
: "${LOG_RETENTION:=14 Tage}"
: "${LEGAL_BASIS:=Art. 6 Abs. 1 lit. f DSGVO}"
: "${GOOGLE_OAUTH:=nein}"
: "${GOOGLE_OAUTH_DETAILS:=Keine Google-OAuth-Integration aktiv.}"
: "${ANALYTICS_ENABLED:=nein}"
: "${ANALYTICS_DETAILS:=Es werden keine Analyse- oder Tracking-Tools eingesetzt.}"
: "${COOKIES_ENABLED:=nein}"
: "${COOKIES_DETAILS:=Es werden nur technisch notwendige Cookies verwendet oder keine Cookies gesetzt.}"
: "${TERMS_SCOPE:=Diese Nutzungsbedingungen gelten für die Nutzung dieser Website und der angebotenen Dienste.}"
: "${ACCOUNT_REQUIRED:=nein}"
: "${TERMINATION_RULES:=Wir können den Zugang bei Missbrauch oder Rechtsverstößen einschränken oder beenden.}"
: "${LIABILITY_RULES:=Wir haften unbeschränkt bei Vorsatz und grober Fahrlässigkeit sowie nach den gesetzlichen Vorschriften.}"
: "${GOVERNING_LAW:=Es gilt deutsches Recht unter Ausschluss des UN-Kaufrechts, soweit zulässig.}"
: "${LAST_UPDATED:=2026-04-13}"

for file in /templates/*.template; do
  filename=$(basename "$file" .template)
  envsubst < "$file" > "$OUTPUT_DIR/$filename"
done

nginx -g 'daemon off;'
