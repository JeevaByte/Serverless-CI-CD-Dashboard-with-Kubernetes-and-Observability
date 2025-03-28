# Serverless CI/CD PoC
A proof of concept combining serverless (AWS Lambda), CI/CD (GitHub Actions), Kubernetes, and observability (Prometheus).

## Setup
1. Install Terraform, Python, and AWS CLI.
2. Set up AWS credentials in GitHub Secrets (`AWS_ACCESS_KEY_ID`, `AWS_SECRET_ACCESS_KEY`).
3. Push to GitHub to trigger the CI/CD pipeline.
4. Deploy Kubernetes resources with `helm install`.

## Next Steps
- Add a real dashboard app.
- Integrate Grafana with Prometheus.