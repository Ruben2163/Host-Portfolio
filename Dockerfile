FROM alpine:latest

RUN apk add --no-cache \
    git \
    openssh \
    hugo \
    nginx \
    bash \
    curl

# Create working directory
WORKDIR /site

# Copy the start script
COPY start.sh /start.sh
RUN chmod +x /start.sh

EXPOSE 80

CMD ["/start.sh"]