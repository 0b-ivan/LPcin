# Legal Pages Container

Kleines Docker-Projekt zum Hosting von:

- Datenschutzerklärung
- Nutzungsbedingungen
- Impressum

Die Inhalte werden beim Start des Containers per Umgebungsvariablen in HTML-Templates eingesetzt.

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

docker run --rm -p 8080:80 \
  -e COMPANY_NAME="Meine GmbH" \
  -e CONTACT_EMAIL="privacy@example.com" \
  -e COMPANY_ADDRESS="Musterstraße 1, 12345 Berlin" \
  -e GOOGLE_OAUTH="ja" \
  -e GOOGLE_OAUTH_DETAILS="Wir bieten eine Anmeldung über Google OAuth an." \
  legal-pages
```

## Wichtiger Hinweis

Dieses Projekt ist ein technisches Template und keine Rechtsberatung. Die Formulierungen sind bewusst allgemein gehalten und müssen an dein tatsächliches Produkt, deine Prozesse und die für dich geltenden gesetzlichen Pflichten angepasst werden.
