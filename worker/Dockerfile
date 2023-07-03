FROM chatwoot/chatwoot:v2.18.0

RUN chmod +x docker/entrypoints/rails.sh

ARG DATABASE_URL DEFAULT_LOCALE FRONTEND_URL RAILS_ENV REDIS_URL SECRET_KEY_BASE
ENV $DATABASE_URL $DEFAULT_LOCALE $FRONTEND_URL $RAILS_ENV $REDIS_URL $SECRET_KEY_BASE

RUN bundle exec rails db:chatwoot_prepare && bundle exec rails db:migrate

ENTRYPOINT ["docker/entrypoints/rails.sh"]

CMD bundle exec sidekiq -C config/sidekiq.yml