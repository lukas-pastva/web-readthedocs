FROM pardahlman/sphinx

COPY ./app /app

# RUN rm /docker-entrpoint.sh
ADD docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]