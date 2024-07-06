# hello-world-ci-cd

# create GKE cluster using gcloud command
gcloud container clusters create hello-world-cluster-tokyo \
  --zone asia-northeast1-a \
  --num-nodes 1 \
  --machine-type e2-small \
  --disk-size 10GB \
  --enable-autorepair \
  --enable-autoupgrade \
  --enable-autoscaling \
  --min-nodes 0 \
  --max-nodes 3 \
  --project gentle-dominion-245803
