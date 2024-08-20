add-helm-repo:
	@helm repo add grafana https://grafana.github.io/helm-charts
	@echo "Adding OpenTelemetry Helm Repo..."
	@helm repo add open-telemetry https://open-telemetry.github.io/opentelemetry-helm-charts
	@echo "Helm Repos added successfully"
install-grafana:
	@echo "Installing Grafana..."
	@helm upgrade -i  grafana grafana/grafana -f ./values/grafana.yaml  --create-namespace
	@echo "Grafana installed successfully"

install-mimir:
	@echo "Installing Mimir..."
	@helm upgrade -i mimir grafana/mimir-distributed -f ./values/mimir.yaml  --create-namespace
	@echo "Mimir installed successfully"

install-tempo:
	@echo "Installing Tempo..."
	@helm upgrade -i  tempo grafana/tempo-distributed -f ./values/tempo.yaml  --create-namespace
	@echo "Tempo installed successfully"

install-loki:
	@echo "Installing Loki..."
	@helm upgrade -i loki grafana/loki-distributed -f ./values/loki.yaml  --create-namespace
	@echo "Loki installed successfully"

install-otel-collector:
	@echo "Installing OpenTelemetry Collector..."
	@helm upgrade -i  opentelemetry-collector open-telemetry/opentelemetry-collector -f ./values/opentelemetry-collector.yaml
	@echo "OpenTelemetry Collector installed successfully"
install-all: install-grafana install-mimir install-tempo install-loki install-otel-collector
	@echo "All components installed successfully"