superset db upgrade && superset fab create-admin \
  --username $ADMIN_USERNAME \
  --firstname Admin \
  --lastname Admin \
  --email $ADMIN_EMAIL \
  --password $ADMIN_PASSWORD && \
superset init && \
gunicorn --bind 0.0.0.0:8088 --workers 4 "superset.app:create_app()"
```
- **Port:** `8088` → HTTP ile Public Networking aç
- **Healthcheck:** `/health`

**Variables:**
```
DATABASE_URL=${{Postgres.DATABASE_URL}}
REDIS_URL=${{Redis.REDIS_URL}}
SECRET_KEY=${{secret(32)}}
SUPERSET_ENV=production
ADMIN_USERNAME=admin
ADMIN_EMAIL=admin@example.com
ADMIN_PASSWORD=${{secret(16)}}
SQLALCHEMY_DATABASE_URI=${{Postgres.DATABASE_URL}}
CELERY_BROKER_URL=${{Redis.REDIS_URL}}
CELERY_RESULT_BACKEND=${{Redis.REDIS_URL}}
