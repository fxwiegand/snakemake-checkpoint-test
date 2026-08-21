rule all:
    input:
        "result.txt"


checkpoint split:
    output:
        directory("parts")
    shell:
        "mkdir {output}; echo one > {output}/a.txt; echo two > {output}/b.txt"


rule process:
    input:
        "parts/{i}.txt"
    output:
        "processed/{i}.txt"
    shell:
        "tr a-z A-Z < {input} > {output}"


def aggregate(wildcards):
    parts = checkpoints.split.get().output[0]
    return expand("processed/{i}.txt", i=glob_wildcards(parts + "/{i}.txt").i)


rule aggregate:
    input:
        aggregate
    output:
        "result.txt"
    shell:
        "cat {input} > {output}"
