FROM python:3.11-slim

# Set up work directory
WORKDIR /aegisflow

# Install system tools
RUN apt-get update && apt-get install -y curl jq git && rm -rf /var/lib/apt/lists/*

# Install Python deps
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Install Syft
RUN curl -sSfL https://raw.githubusercontent.com/anchore/syft/main/install.sh | sh -s -- -b /usr/local/bin

# Install Trivy
RUN curl -sfL https://raw.githubusercontent.com/aquasecurity/trivy/main/contrib/install.sh | sh -s -- -b /usr/local/bin

# Install Semgrep
RUN pip install semgrep

# Copy rest of project
COPY . .

CMD ["bash"]
