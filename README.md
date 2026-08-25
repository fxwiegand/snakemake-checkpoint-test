# snakemake-checkpoint-test

Minimal datavzrd report to S3, to debug the ProtectedOutputException. Needs conda for the datavzrd wrapper.

```bash
snakemake --sdm conda --default-storage-provider s3 --default-storage-prefix s3://<bucket>/probe -c1
snakemake --sdm conda --default-storage-provider s3 --default-storage-prefix s3://<bucket>/probe -c1 --forcerun make_report
```

Send back `cache_probe.log` and any error.
