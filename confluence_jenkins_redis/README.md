# Scanning for Confluence, Jenkins, and Redis

Duke University identified an intrusion through a vulnerable Confluence web application that began scanning for Jenkins and Redis servers once on the system. We have put together a quick Nmap script to identify these services to determine whether they may be vulnerable.

Run something like:

```
nmap --script +http-enum --script-args="http-enum.fingerprintfile=./confluence_jenkins_fingerprints.nse" -p 80,443,6379,8080 --open 192.0.2.0/24
```

You should receive output like:

```
Nmap scan report for 192.0.2.10
Host is up (0.034s latency).
Not shown: 2 filtered ports
PORT    STATE SERVICE
80/tcp  open  http
443/tcp open  https
| http-enum:
|_  /aboutconfluencepage.action: Confluence server

Nmap scan report for 192.0.2.20
Host is up (0.035s latency).
Not shown: 2 filtered ports
Some closed ports may be reported as filtered due to --defeat-rst-ratelimit
PORT     STATE SERVICE
443/tcp  open  https
8080/tcp open  http-proxy
| http-enum:
|_  /login: Jenkins service

Nmap scan report for 192.0.2.30
Host is up (0.037s latency).

PORT     STATE SERVICE
80/tcp   open  http
443/tcp  open  https
6379/tcp open  redis
8080/tcp open  http-proxy
```

Confluence and Jenkins servers should be reported by the http-enum module, and any systems with port 6379 open are likely running Redis.
