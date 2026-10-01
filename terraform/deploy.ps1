$env:TF_VAR_db_password = "YOUR_DB_PASSWORD"

terraform init

terraform validate

terraform apply -auto-approve

aws eks update-kubeconfig `
  --region ap-south-1 `
  --name employee-cluster

kubectl get nodes

cd ..

kubectl apply -f k8s/

kubectl get pods

kubectl get svc