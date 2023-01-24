add-apt-repository ppa:openjdk-r/ppa || true & 
wait
apt-get update || true & 
wait
apt install -y openjdk-11-jdk || true & 
wait

wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | apt-key add - || true & 
wait
sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list' || true & 
wait
apt update || true & 
wait
apt install -y jenkins || true & 
wait
systemctl start jenkins || true & 
wait
systemctl status jenkins || true & 
wait