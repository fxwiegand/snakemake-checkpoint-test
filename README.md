# snakemake-checkpoint-test

Logs local storage-cache permissions to debug a ProtectedOutputException with S3 storage.

```bash
snakemake --default-storage-provider s3 --default-storage-prefix s3://<bucket>/probe -c1
snakemake --default-storage-provider s3 --default-storage-prefix s3://<bucket>/probe -c1 --forcerun make_report
```

Run both in the same directory on the shared workspace, then send `probe.log`.
