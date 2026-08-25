# snakemake-checkpoint-test

Reproduces a ProtectedOutputException for an S3 directory output whose local cache copy is not writable.

```bash
snakemake --default-storage-provider s3 --default-storage-prefix s3://koesterlab/probe -c1 make_report

cache=.snakemake/storage/s3/koesterlab/probe/results/report
mkdir -p "$cache" && echo hi > "$cache/index.html" && chmod -R a-w "$cache"

snakemake --default-storage-provider s3 --default-storage-prefix s3://koesterlab/probe -c1 --forcerun make_report
```

The second command raises the ProtectedOutputException.
