import os
import pwd


def probe_cache(wildcards):
    with open("cache_probe.log", "a") as f:
        f.write(f"# build: user={pwd.getpwuid(os.getuid()).pw_name} uid={os.getuid()}\n")
        for root, dirs, files in os.walk(".snakemake/storage"):
            for name in sorted(dirs + files):
                p = os.path.join(root, name)
                st = os.lstat(p)
                f.write(
                    f"  {oct(st.st_mode & 0o7777)} uid={st.st_uid} gid={st.st_gid} "
                    f"w_ok={os.access(p, os.W_OK)} {p}\n"
                )
    return []


rule all:
    input:
        "results/report"


rule scores:
    output:
        "scores.tsv"
    shell:
        "printf 'value\\n1\\n2\\n' > {output}"


rule make_report:
    input:
        probe_cache,
        config=workflow.source_path("config.yaml"),
        scores="scores.tsv",
    output:
        report(directory("results/report"), htmlindex="index.html")
    wrapper:
        "v9.9.0/utils/datavzrd"
