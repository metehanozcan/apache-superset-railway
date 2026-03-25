import os

FEATURE_FLAGS = {
    "ENABLE_TEMPLATE_PROCESSING": True,
}

ENABLE_PROXY_FIX = True

SECRET_KEY = os.environ.get("SECRET_KEY")

# Railway uses DATABASE_URL convention
SQLALCHEMY_DATABASE_URI = os.environ.get("DATABASE_URL")

# Redis / Celery
REDIS_URL = os.environ.get("REDIS_URL", "redis://localhost:6379/0")

class CeleryConfig:
    broker_url = REDIS_URL
    result_backend = REDIS_URL

CELERY_CONFIG = CeleryConfig

# Cache
CACHE_CONFIG = {
    "CACHE_TYPE": "RedisCache",
    "CACHE_DEFAULT_TIMEOUT": 300,
    "CACHE_KEY_PREFIX": "superset_",
    "CACHE_REDIS_URL": REDIS_URL,
}

DATA_CACHE_CONFIG = CACHE_CONFIG
