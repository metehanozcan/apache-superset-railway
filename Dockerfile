FROM apache/superset:6.0.0

USER root

RUN apt-get update && apt-get install -y \
    pkg-config \
    libmariadb-dev \
    default-libmysqlclient-dev \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

RUN pip install mysqlclient 

COPY config/superset_init.sh ./superset_init.sh
RUN chmod +x ./superset_init.sh

COPY config/superset_config.py /app/superset_config.py

ENV SUPERSET_CONFIG_PATH=/app/superset_config.py

HEALTHCHECK --interval=30s --timeout=10s --retries=3 \
  CMD curl -f http://localhost:8088/health || exit 1

USER root

ENTRYPOINT ["./superset_init.sh"]
