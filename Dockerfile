FROM python:3.9-slim

# Install system dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends gcc libpq-dev curl && \
    rm -rf /var/lib/apt/lists/*

# Create working folder and install Python dependencies
WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -U pip wheel && \
    pip install --no-cache-dir -r requirements.txt

# Copy the application contents
COPY service/ ./service/

# Switch to a non-root user compatible with OpenShift arbitrary UIDs (GID 0)
RUN useradd --uid 1000 --gid 0 -m -d /app theia && \
    chown -R 1000:0 /app && \
    chmod -R g=u /app
USER 1000

# Expose port 8000
ENV FLASK_APP=service:app
ENV PORT=8000
EXPOSE 8000

# Configure container healthcheck
HEALTHCHECK --interval=30s --timeout=5s --start-period=10s --retries=3 \
    CMD curl -f http://localhost:8000/health || exit 1

# Start the Flask service using gunicorn on port 8000
ENTRYPOINT ["gunicorn"]
CMD ["--bind=0.0.0.0:8000", "--log-level=info", "service:app"]
