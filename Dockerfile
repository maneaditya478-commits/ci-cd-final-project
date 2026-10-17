FROM python:3.9-slim

# Create working folder and install dependencies
WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -U pip wheel && \
    pip install --no-cache-dir -r requirements.txt

# Copy application contents
COPY service/ ./service/

# Switch to non-root user (compatible with OpenShift arbitrary UIDs)
RUN useradd --uid 1000 --gid 0 -m -d /app theia && \
    chown -R 1000:0 /app && \
    chmod -R g=u /app
USER 1000

# Set environment variables
ENV FLASK_APP=service:app
ENV PORT=8080

# Expose microservice application port
EXPOSE 8080

# Run service using Gunicorn
CMD ["gunicorn", "--bind=0.0.0.0:8080", "--log-level=info", "service:app"]
