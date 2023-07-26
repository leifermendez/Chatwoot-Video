FROM chatwoot/chatwoot:v2.18.0-ce

ARG FRONTEND_URL ACTIVE_STORAGE_SERVICE DATABASE_URL DEFAULT_LOCALE INSTALLATION_ENV NODE_ENV RAILS_ENV REDIS_URL SECRET_KEY_BASE

RUN apk add --no-cache multirun

RUN chmod +x docker/entrypoints/rails.sh

# ENV FRONTEND_URL=$FRONTEND_URL ACTIVE_STORAGE_SERVICE=$ACTIVE_STORAGE_SERVICE DATABASE_URL=$DATABASE_URL DEFAULT_LOCALE=$DEFAULT_LOCALE INSTALLATION_ENV=$INSTALLATION_ENV NODE_ENV=$NODE_ENV RAILS_ENV=$RAILS_ENV REDIS_URL=$REDIS_URL SECRET_KEY_BASE=$SECRET_KEY_BASE

# sleep 3 is needed because this service could start building before the databases have started
RUN sleep 3 && bundle exec rails db:chatwoot_prepare && bundle exec rails db:migrate

# ENTRYPOINT ["docker/entrypoints/rails.sh"]

ENTRYPOINT ["multirun"]

CMD ["docker/entrypoints/rails.sh bundle exec sidekiq -C config/sidekiq.yml", "docker/entrypoints/rails.sh bundle exec bundle exec rails s -b 0.0.0.0 -p $PORT"]