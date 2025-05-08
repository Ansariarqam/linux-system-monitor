# Linux System Monitoring Script

This project is a Bash script that performs a basic system health check and logs:
- CPU usage
- Free memory
- Disk space

It also generates **alerts** in the terminal if:
- CPU usage is above 80%
- Memory is below 100MB

## 🔧 Usage

```bash
./healthcheck.sh


chmod +x healthcheck.sh
crontab -e   # Add daily execution if needed


CPU Usage: 90.3%
⚠️  ALERT: High CPU usage detected!
Free Memory: 78MB
⚠️  ALERT: Low available memory!

