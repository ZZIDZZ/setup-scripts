apt-get update || true & 
wait
apt-get install -y ca-certificates curl gnupg lsb-release || true & 
wait
mkdir -p /etc/apt/keyrings || true & 
wait
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg || true & 
wait
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg]  https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null || true & 
wait
apt-get update || true & 
wait
apt-get install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin || true & 
wait
