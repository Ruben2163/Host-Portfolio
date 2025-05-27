# Dockerfile

FROM alpine:latest

# Install dependencies
RUN apk add --no-cache \
    git \
    hugo \
    nginx \
    bash \
    curl

# Clone Hugo repo (assumes private key or access token is handled)
ARG HUGO_REPO=https://github.com/Ruben2163/portfolio.git
ARG BRANCH=main

# Create directories
WORKDIR /site

# Clone and build on container start
COPY start.sh /start.sh
RUN chmod +x /start.sh

EXPOSE 80

CMD ["/start.sh"]
