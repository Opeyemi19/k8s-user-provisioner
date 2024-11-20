FROM python:3.10

WORKDIR /app

ARG PROFILE=dev

COPY . .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Install OpenTelemetry dependencies
RUN pip install opentelemetry-api opentelemetry-distro opentelemetry-exporter-otlp opentelemetry-instrumentation-flask
RUN opentelemetry-bootstrap -a install

# Make sure entrypoint.sh is executable
RUN chmod 755 entrypoint.sh

EXPOSE 5000

# Set entrypoint
ENTRYPOINT ["./entrypoint.sh"]
