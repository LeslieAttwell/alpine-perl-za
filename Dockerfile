FROM alpine:latest

# Add user to make sure containre do not run as root
RUN addgroup -S mars && adduser -S elonmusk  && addgroup -S elonmusk mars

# Change Timezone to ZA
COPY files/timezone files/localtime /etc/

# Install Perl with required modules
RUN apk add --update perl perl-json perl-dbd-mysql perl-socket perl-socket-getaddrinfo perl-net-dns perl-snmp-session freeradius-mssql curl && rm -rf /var/cache/apk/*

# Change to nonroot user
USER elonmusk

# Optional Entrypoint
#ENTRYPOINT ["/usr/bin/perl", "-de0"]
