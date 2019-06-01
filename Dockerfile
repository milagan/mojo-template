FROM perl:5.26-threaded

ENV PERL_CPANM_OPT="--notest --force --skip-satisfied"

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    libsqlite3-dev \
    sqlite3 \
    && rm -rf /var/lib/apt/lists/*

COPY . /root/evolvestore

RUN cd /root/evolvestore \
    && cpanm --installdeps . \
    && rm -fr ./cpanm /root/.cpanm /usr/src/perl /tmp/* \
    && perl Makefile.PL \
    && make \
    && cd -

WORKDIR /root/evolvestore

EXPOSE 8080/tcp

CMD ["bash", "./docker-entrypoint.sh"]

