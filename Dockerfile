FROM alpine:latest

RUN apk add --no-cache \
    git \
    openssh \
    hugo \
    nginx \
    bash \
    curl

WORKDIR /site

# Copy entrypoint script
COPY start.sh /start.sh
RUN chmod +x /start.sh

# Expose Nginx default port
EXPOSE 80

# Begins process by running chmod = (~start.sh)
CMD ["/start.sh"]
