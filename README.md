# Clamav on Upsun

Here is a demonstration of how to use the ClamAV (antivirus) service and do some checks while uploading files in a PHP form.

If you want to read more, please see blogpost [Deploy ClamAV on Upsun, on service mode](https://devcenter.upsun.com/posts/deploying-clamav-service/)

## Requirement

To function properly, ClamAV requires a minimum of **1.5 GB of memory**.  
You can define the list of virus databases to fetch in the `etc/freshclam.conf` file.

## Usages

You have two protection solutions:

- **One-time scan**: Allows you to trigger a scan either on a one-time or recurring basis (CRON).  
  In this case, ClamAV is not continuously running as a daemon.
- **Service scan**: Allows you to trigger a resource scan on demand through an external trigger (calling a TCP endpoint).  
  In this case, ClamAV runs continuously as a daemon.

### One-time scan

You can use :
```
./scripts/clam_update-db.sh   # Use to update virus database.
./scripts/clam_scan.sh        # Scan folder and move into quarantine.
```

for CRON usage :
```
application:
  mon-app:
  ...
    crons:
      update-db:
        spec: '0 0 * * *'
        commands:
          start: ./scripts/clam_update-db.sh
          stop: pkill freshclam

      scan-files:
        spec: 'H * * * *'
        commands:
          start: ./scripts/clam_scan.sh
          stop: pkill clamscan
```

### Services

You can use :
```
./scripts/clam_update-db.sh   # Use to update virus database.
./scripts/clam_scan-clt.sh    # Scan folder and move into quarantine.
```
