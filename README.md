# DevOps Metrics Reporter 🚀

A full-stack Spring Boot + PostgreSQL + Docker + GitHub Webhook-based application to track CI/CD pipeline events. Integrates with Grafana for visualizing build metrics and Prometheus for alerting.

---

## 🌟 Features

- GitHub Webhook listener (`/webhook/github`)
- Tracks events: repo name, branch, trigger type, build status, duration, timestamp
- RESTful API endpoints (in development)
- PostgreSQL storage for persistence
- Docker Compose-based local deployment
- Gradle automation: clean build without tests
- Tunnel-ready: expose `localhost` using Loophole or Cloudflare Tunnel
- Future: Grafana dashboards, Prometheus alerts

---

## 🛠 Tech Stack

| Layer      | Tool/Framework          |
| ---------- | ----------------------- |
| Backend    | Spring Boot (Java 21)   |
| Database   | PostgreSQL 15           |
| Container  | Docker + Docker Compose |
| Monitoring | Prometheus + Grafana    |
| Deployment | GitHub Actions          |

---

## 📦 Folder Structure

.
├── src
│ └── main/java/com/divyaranjansahoo/metrics_reporter
│ ├── controller
│ ├── model
│ └── repository
├── docker-compose.yml
├── Dockerfile
├── build.gradle.kts
├── settings.gradle.kts
├── loophole.exe
├── req.sh
├── help.md
├── dbconfig.sql
├── README.md
└── .github/workflows/devopsflow.yml

## ⚙️ Local Development

### Prerequisites

- Docker + Docker Compose
- Java 21
- Gradle

---

### 🚀 Build and Run (Locally)

```bash
./gradlew clean build -x test
docker-compose up --build
```

## 🌐 Expose to Public

### 1. Loophole (with HTTPS)

```bash
npm install -g @loophole/cloud
loophole http 8080 --hostname div.loophole.site
```

### 2. Cloudflare Tunnel

```bash
cloudflared tunnel --url http://localhost:8080
```

## 🔁 GitHub Actions Automation

✅ On every push:

- Clean & build Gradle project (skip tests)
- Trigger Docker Compose locally (requires Docker CLI on runner)
- _(Optional)_ Auto-deploy webhook listener for testing

📂 See [`./github/workflows/full-devops-flow.yml`](./github/workflows/devopsflow.yml) _(WIP)_

---

## 🧭 Roadmap

- [x] PostgreSQL + Spring Boot setup
- [x] Docker Compose integration
- [x] Webhook endpoint (`/webhook/github`)
- [ ] Parse real GitHub payload
- [ ] Create REST endpoints (GET builds, stats)
- [ ] Grafana dashboards (event trends)
- [ ] Prometheus alerting on anomalies
- [ ] Optional: Kafka or Redis for async ingestion

---

## 👤 Author

**Divyaranjan Sahoo**  
🌐 [Portfolio](https://divyaranjansahoo.vercel.app)
📫 [LinkedIn](https://linkedin.com/in/divyaranjansahoo)  
🐱 [GitHub](https://github.com/DivInstance)

---

## 📄 License

MIT License – Use freely, modify smartly, credit kindly.
