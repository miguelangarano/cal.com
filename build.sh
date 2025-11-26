# Set your configuration
export DOCKERHUB_USERNAME="miguelangarano"
export NEXT_PUBLIC_WEBAPP_URL="https://cal.qaid.cloud"
export NEXT_PUBLIC_API_V2_URL="https://cal.qaid.cloud/api/v2"

# Ensure buildx is set up (useful for cross-platform builds like x64 on Mac)
docker buildx create --use --name calcom-builder || true

# Build and Push
docker buildx build \
  --platform linux/amd64 \
  --push \
  --tag "${DOCKERHUB_USERNAME}/calcom-whitelabel:latest" \
  --build-arg NEXT_PUBLIC_WEBAPP_URL="${NEXT_PUBLIC_WEBAPP_URL}" \
  --build-arg NEXT_PUBLIC_API_V2_URL="${NEXT_PUBLIC_API_V2_URL}" \
  --build-arg NEXT_PUBLIC_LICENSE_CONSENT=true \
  --build-arg CALCOM_TELEMETRY_DISABLED=1 \
  .