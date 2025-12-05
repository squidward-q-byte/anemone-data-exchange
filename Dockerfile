FROM debian:stable-slim

# Install dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    curl ca-certificates gnupg unzip \
    openjdk-21-jre-headless \
    python3 python3-pip \
    nodejs npm \
    && rm -rf /var/lib/apt/lists/*

# Download a specific version of avro-tools (adjust as needed)
ARG AVRO_VERSION=1.12.1
RUN curl -fsSL "https://dlcdn.apache.org/avro/avro-${AVRO_VERSION}/java/avro-tools-${AVRO_VERSION}.jar" \
    -o /opt/avro-tools.jar

# Workdir layout:
# /work/avdl       -> input .avdl files
# /work/out/avpr   -> generated .avpr protocols
# /work/out/avsc   -> generated .avsc schemas
# /work/gen/java   -> generated Java classes (official avro-tools)
# /work/gen/ts     -> generated TypeScript (community generator, optional)
# /work/gen/py     -> generated Python (community generator, optional)
WORKDIR /work
RUN mkdir -p /work/avdl /work/out/avpr /work/out/avsc

# Copy entrypoint script
COPY build.sh /usr/local/bin/build.sh
RUN chmod +x /usr/local/bin/build.sh

# Default command runs the conversion and optional codegen
ENTRYPOINT ["/usr/local/bin/build.sh"]
