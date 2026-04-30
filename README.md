#  University Digital Notice Board

A static multi-page website for COMSATS University Islamabad, Lahore Campus — displaying academic notices, exam schedules, and admission updates for Spring/Fall 2025.

##  Team

| Name | GitHub | Role |
|------|--------|------|
| Muneefah | @mun33fa | Team Lead |
| Uswah | @uswah | Team Member |

##  Project Structure

- `src/` — HTML pages (5 pages)
- `styles/` — CSS stylesheet
- `.github/workflows/` — GitHub Actions CI/CD pipeline
- `Dockerfile` — Multi-stage Docker build

##  CI/CD Pipeline

The pipeline runs automatically on every push to `develop`:

1. **Job 1 — Lint**: HTMLHint checks HTML, Stylelint checks CSS
2. **Job 2 — Build**: Parcel bundles the static site into `dist/`
3. **Job 3 — Docker**: Builds image and pushes to Docker Hub (only on push, not PRs)

##  Docker

Pull and run the image:

```bash
docker pull YOUR_DOCKERHUB_USERNAME/uni-notice-board:latest
docker run -d -p 8080:80 uni-notice-board:latest
```

Visit: http://localhost:8080

##  Links

- GitHub Repo: https://github.com/mun33fa/uni-notice-board.git
- Docker Hub: https://hub.docker.com/repository/docker/mun33fa/uni-notice-board