# Legal Pages Container

Kleines Docker-Projekt zum Hosting von:

- Datenschutzerklärung
- Nutzungsbedingungen
- Impressum

Die Inhalte werden beim Start des Containers per Umgebungsvariablen in HTML-Templates eingesetzt.

## Für deinen Fall vorbereitet

Die `.env.example` ist bereits auf einen privaten Cloud-Dienst mit den folgenden Komponenten zugeschnitten:

- Authentik
- Nextcloud
- Matrix
- Nextcloud Talk
- Photos
- Maps
- Dateispeicher
- Google SSO

Außerdem sind Platzhalter für Backup-Retention, RPO/RTO und verschlüsselte Datenablage enthalten.

## Start mit Docker Compose

```bash
cp .env.example .env
# .env anpassen

docker compose up --build
```

Danach erreichbar unter:

- http://localhost:8080/
- http://localhost:8080/privacy.html
- http://localhost:8080/terms.html
- http://localhost:8080/imprint.html

## Start mit docker run

```bash
docker build -t legal-pages .

docker run --rm -p 8080:80 --env-file .env legal-pages
```

## Wichtige offene Stellen

Vor Veröffentlichung solltest du mindestens diese Felder vervollständigen:

- `COMPANY_ADDRESS`
- `MANAGING_DIRECTOR`
- `DATA_CONTROLLER`
- `HOSTING_PROVIDER`
- `HOSTING_LOCATION`
- `CONTACT_EMAIL`
- `DPO_CONTACT`

## Wichtiger Hinweis

Dieses Projekt ist ein technisches Template und keine Rechtsberatung. Die Formulierungen sind bewusst praxisnah vorbereitet, müssen aber an deinen tatsächlichen Betrieb und an die für dich geltenden gesetzlichen Pflichten angepasst werden.
