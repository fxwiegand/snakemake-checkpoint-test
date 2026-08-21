# snakemake-checkpoint-test

Minimal checkpoint workflow for testing with S3 storage.

```bash
pip install snakemake snakemake-storage-plugin-s3

export SNAKEMAKE_STORAGE_S3_ENDPOINT_URL=https://...
export SNAKEMAKE_STORAGE_S3_ACCESS_KEY=...
export SNAKEMAKE_STORAGE_S3_SECRET_KEY=...

snakemake --default-storage-provider s3 --default-storage-prefix s3://<bucket>/checkpoint-test -c1
```
