FROM chatwoot/chatwoot:v2.18.0-ce

RUN chmod +x docker/entrypoints/rails.sh

ARG FRONTEND_URL ACTIVE_STORAGE_SERVICE DATABASE_URL DEFAULT_LOCALE INSTALLATION_ENV NODE_ENV RAILS_ENV REDIS_URL SECRET_KEY_BASE
ENV $FRONTEND_URL $ACTIVE_STORAGE_SERVICE $DATABASE_URL $DEFAULT_LOCALE $INSTALLATION_ENV $NODE_ENV $RAILS_ENV $REDIS_URL $SECRET_KEY_BASE

RUN bundle exec rails db:chatwoot_prepare && bundle exec rails db:migrate

ENTRYPOINT ["docker/entrypoints/rails.sh"]

CMD bundle exec bundle exec rails s -b 0.0.0.0 -p $PORT