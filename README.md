# snakemake-checkpoint-test

Minimal datavzrd report to S3, to debug the ProtectedOutputException. Needs conda for the datavzrd wrapper.

```bash
snakemake --sdm conda --default-storage-provider s3 --default-storage-prefix s3://<bucket>/probe -c1 --report-after-run --report report.zip
snakemake --sdm conda --default-storage-provider s3 --default-storage-prefix s3://<bucket>/probe -c1 --forcerun make_report --report-after-run --report report.zip
```

Run both in the same directory, then send back `cache_probe.log` and any error. Also run `umask` in the same shell.
