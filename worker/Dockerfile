FROM chatwoot/chatwoot:v2.18.0

RUN chmod +x docker/entrypoints/rails.sh

ARG ACTIVE_STORAGE_SERVICE DATABASE_URL DEFAULT_LOCALE INSTALLATION_ENV NODE_ENV RAILS_ENV REDIS_URL SECRET_KEY_BASE
ENV $ACTIVE_STORAGE_SERVICE $DATABASE_URL $DEFAULT_LOCALE $INSTALLATION_ENV $NODE_ENV $RAILS_ENV $REDIS_URL $SECRET_KEY_BASE

RUN bundle exec rails db:chatwoot_prepare && bundle exec rails db:migrate

ENTRYPOINT ["docker/entrypoints/rails.sh"]

CMD bundle exec sidekiq -C config/sidekiq.yml