# Mission Control

Homelab ops dashboard pulling live data from free public APIs.

![nginx](https://img.shields.io/badge/nginx-alpine-green)
![APIs](https://img.shields.io/badge/APIs-free%20%26%20keyless-blue)

## Data Sources

| Panel | API | Refresh |
|-------|-----|---------|
| Weather (Sofia) | [Open-Meteo](https://open-meteo.com/) | 5 min |
| Crypto Ticker | [CoinGecko](https://www.coingecko.com/en/api) | 5 min |
| NASA APOD | [NASA API](https://api.nasa.gov/) (DEMO_KEY) | on load |
| World Clock | Browser JS | 1 sec |
| Uptime | Simulated (swap with real monitoring) | static |

## Deploy

### Quick local test
```bash
docker build -t mission-control .
docker run --rm -p 8080:80 mission-control
```

### k3s + ArgoCD
```bash
# 1. Create the repo on GitHub
# 2. Push this code
# 3. Apply the ArgoCD app:
kubectl apply -f argocd-app.yaml

# 4. Set Ingress host in k8s.yaml to your domain
```

### CI/CD
GitHub Actions builds and pushes `dimitar6768/mission-control:latest` on every push to `main`.

Set these repo secrets:
- `DOCKERHUB_USERNAME`
- `DOCKERHUB_TOKEN`
