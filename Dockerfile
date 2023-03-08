FROM pardahlman/sphinx

COPY ./docs /docs

RUN rm /docker-entrpoint.sh
ADD docker-entrypoint.sh /
RUN chmod +x docker-entrypoint.sh

ENTRYPOINT ["docker-entrypoint.sh"]