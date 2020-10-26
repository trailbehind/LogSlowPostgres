FROM postgres:13-alpine

ADD log-slow-queries.sh /
WORKDIR /
CMD "/log-slow-queries.sh"
