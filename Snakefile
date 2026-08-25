import os
import pwd


def probe(tag):
    with open("probe.log", "a") as log:
        log.write(f"# {tag}: user={pwd.getpwuid(os.getuid()).pw_name} uid={os.getuid()}\n")
        for root, dirs, files in os.walk(".snakemake/storage"):
            for name in sorted(dirs + files):
                p = os.path.join(root, name)
                st = os.lstat(p)
                log.write(
                    f"  {oct(st.st_mode & 0o7777)} uid={st.st_uid} gid={st.st_gid} "
                    f"w_ok={os.access(p, os.W_OK)} {p}\n"
                )


def build_probe(wildcards):
    probe("build")
    return []


rule all:
    input:
        "report"


rule make_report:
    input:
        build_probe
    output:
        directory("report")
    shell:
        "mkdir -p {output}; echo hi > {output}/index.html"
