FROM python:3.13-slim

WORKDIR /app

COPY pyproject.toml ./
COPY src/ ./src/

RUN pip install --no-cache-dir -e .

ENV PYTHONUNBUFFERED=1
ENV MCP_TRANSPORT=sse
ENV MCP_PORT=8080
ENV QDRANT_URL=http://qdrant:6333
ENV OLLAMA_URL=http://ollama:11434
ENV OLLAMA_EMBED_MODEL=nomic-embed-text

EXPOSE 8080

CMD ["python", "-m", "podzone_mpc.context_server", "--transport", "sse", "--port", "8080"]
