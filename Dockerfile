FROM python:3.8-alpine3.12

# Update apk repo
RUN echo "https://dl-4.alpinelinux.org/alpine/v3.12/main" >> /etc/apk/repositories && \
    echo "https://dl-4.alpinelinux.org/alpine/v3.12/community" >> /etc/apk/repositories

# Install chromedriver
RUN apk update
RUN apk add chromium chromium-chromedriver

# Upgrade pip
RUN pip install --upgrade pip

# Install selenium
RUN pip install selenium

# Create a folder for our project
RUN mkdir -p /synthetic_airpa
WORKDIR /synthetic_airpa

# Copy our docker-script inside /app
COPY syn_airpa.py /synthetic_airpa 

# Run our docker-python-selenium script
ENTRYPOINT python3 syn_airpa.py