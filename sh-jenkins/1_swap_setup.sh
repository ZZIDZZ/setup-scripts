swapon --show || true &
wait

free -h || true &
wait

fallocate -l 2G /swapfile || true &
wait
chmod 600 /swapfile || true &
wait
mkswap /swapfile || true &
wait
swapon /swapfile || true &
wait
swapon --show || true &
wait
free -h || true &
wait
cp /etc/fstab /etc/fstab.bak || true &
wait
echo '/swapfile none swap sw 0 0' | tee -a /etc/fstab|| true &
wait