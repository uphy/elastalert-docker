FROM alpine:3.7

# Install runtime dependencies
RUN apk update && \
    apk --no-cache add ca-certificates openssl python2 py2-pip py2-yaml tzdata

# Install ElastAlert
ARG VERSION=v0.1.30
RUN apk --no-cache add --virtual build-dependencies python2-dev musl-dev gcc openssl-dev libffi-dev curl && \
    # download the archive from official git repository
    mkdir -p /opt && cd /opt && \
    curl -L https://github.com/Yelp/elastalert/archive/${VERSION}.tar.gz | tar xvfz - && \
    mv elastalert* elastalert && \
    # install
    cd /opt/elastalert && \
    pip install -r requirements.txt && \
    python setup.py install && \
    apk del build-dependencies

WORKDIR /opt/elastalert
CMD [ "python", "elastalert/elastalert.py", "--config", "/opt/elastalert/config.yaml" ]