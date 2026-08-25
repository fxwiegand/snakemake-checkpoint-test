rule make_report:
    output:
        directory("results/report")
    shell:
        "mkdir -p {output}; echo hi > {output}/index.html"
