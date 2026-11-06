# Correspondances

Refonte de la billetterie d'un réseau ferroviaire régional : base PostgreSQL 16, migrations Flyway, couche d'accès Spring Data JPA et dossier de performance.

## Structure

```
Correspondances/
  src/       projet Spring Boot (entités, repositories, endpoints, migrations Flyway)
  db/        générateur de volumétrie, requêtes SQL commentées
  docs/      MCD, MLD, MPD, dossier performance
  README.md
```

La conception est décrite dans [docs/modelisation.md](docs/modelisation.md).

## Prérequis

- JDK 21
- Maven : rien à installer, le wrapper `./mvnw` (ou `mvnw.cmd` sous Windows) télécharge Maven 3.9.16
- Docker (base locale et tests)

## Lancer le projet

1. Démarrer PostgreSQL 16 :

   ```bash
   docker compose up -d
   ```

   Base `correspondances`, utilisateur `correspondances`, port **`15432`**. Ce port évite le 5432 d'un PostgreSQL déjà installé sur le poste, ainsi que les plages réservées par Windows (5433-5532 l'est souvent ; vérifier avec `netsh interface ipv4 show excludedportrange protocol=tcp`).

   Pour changer ces valeurs : copier `.env.example` en `.env` (lu par Docker Compose) **et** définir les mêmes variables d'environnement (`DB_PORT`, `DB_USER`…) avant de lancer l'application, car Spring Boot ne lit pas `.env`.

2. Lancer l'application (Flyway applique les migrations au démarrage) :

   ```bash
   ./mvnw spring-boot:run
   ```

   L'application écoute sur http://localhost:18080 (et non 8080, souvent réservé par Windows). Pour changer de port : variable d'environnement `SERVER_PORT`.

3. Arrêter la base : `docker compose down` (ajouter `-v` pour effacer aussi les données).

## Tests

```bash
./mvnw verify
```

Les tests démarrent leur propre PostgreSQL 16 jetable avec Testcontainers : Docker doit être lancé, la base de `docker compose` n'est pas utilisée.

## Générateur de volumétrie

*À compléter (carte 5).*

## Intégration continue

Chaque pull request vers `main` déclenche [.github/workflows/ci.yml](.github/workflows/ci.yml) :

| Job | Rôle |
|---|---|
| Gitleaks | Cherche des secrets dans tout l'historique |
| Build | Compile et empaquette, sans tests |
| Tests | Lancé **seulement si le build réussit** ; exécute `./mvnw verify` |

Une PR ne peut être fusionnée que si les trois jobs sont verts.

## Hook Gitleaks local (recommandé)

Bloque un commit contenant un secret avant même le push :

```bash
pip install pre-commit
pre-commit install
```

## Conventions

- Code, tables, colonnes et contraintes en anglais.
- Le schéma évolue uniquement par migrations Flyway versionnées ; une migration déjà appliquée n'est jamais modifiée.
- Aucun SQL concaténé à la main : requêtes dérivées ou JPQL paramétré.
