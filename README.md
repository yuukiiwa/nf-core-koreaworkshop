# ![nf-core/koreaworkshop](docs/images/nf-core-koreaworkshop_logo_light.png#gh-light-mode-only) ![nf-core/koreaworkshop](docs/images/nf-core-koreaworkshop_logo_dark.png#gh-dark-mode-only)

[![AWS CI](https://img.shields.io/badge/CI%20tests-full%20size-FF9900?labelColor=000000&logo=Amazon%20AWS)](https://nf-co.re/koreaworkshop/results)[![Cite with Zenodo](http://img.shields.io/badge/DOI-10.5281/zenodo.XXXXXXX-1073c8?labelColor=000000)](https://doi.org/10.5281/zenodo.XXXXXXX)

[![Nextflow](https://img.shields.io/badge/nextflow%20DSL2-%E2%89%A523.04.0-23aa62.svg)](https://www.nextflow.io/)
[![run with conda](http://img.shields.io/badge/run%20with-conda-3EB049?labelColor=000000&logo=anaconda)](https://docs.conda.io/en/latest/)
[![run with docker](https://img.shields.io/badge/run%20with-docker-0db7ed?labelColor=000000&logo=docker)](https://www.docker.com/)
[![run with singularity](https://img.shields.io/badge/run%20with-singularity-1d355c.svg?labelColor=000000)](https://sylabs.io/docs/)
[![Launch on Nextflow Tower](https://img.shields.io/badge/Launch%20%F0%9F%9A%80-Nextflow%20Tower-%234256e7)](https://tower.nf/launch?pipeline=https://github.com/nf-core/koreaworkshop)

[![Get help on Slack](http://img.shields.io/badge/slack-nf--core%20%23koreaworkshop-4A154B?labelColor=000000&logo=slack)](https://nfcore.slack.com/channels/koreaworkshop)[![Follow on Twitter](http://img.shields.io/badge/twitter-%40nf__core-1DA1F2?labelColor=000000&logo=twitter)](https://twitter.com/nf_core)[![Follow on Mastodon](https://img.shields.io/badge/mastodon-nf__core-6364ff?labelColor=FFFFFF&logo=mastodon)](https://mstdn.science/@nf_core)[![Watch on YouTube](http://img.shields.io/badge/youtube-nf--core-FF0000?labelColor=000000&logo=youtube)](https://www.youtube.com/c/nf-core)

## Introduction

**nf-core/koreaworkshop** is a hands-on exercise for the nextflow training at the Korean Genome Organization (KOGO) Winter Symposium. This pipeline will contain the following functionalities:

1. Alignment with minimap2 
2. Read statistics with samtools

## Prior to the workshop (Feb 1.) please install the following software

### Java v11+
Check whether it is installed with the following:
```
java -version
```

### nextflow
```
wget https://github.com/nextflow-io/nextflow/releases/download/v23.10.0/nextflow
chmod +x nextflow
./nextflow
# mv nextflow ~/bin/ # move nextflow to your user path or you can also execute nextflow by typing the path to nextflow
```

### nf-core tools
```
pip install nf-core
```

### docker
Please follow the instruction on https://docs.docker.com/engine/install/ to install docker.
Check whether it is installed with the following:
```
docker info
```

### repository clone
```
git clone https://github.com/yuukiiwa/nf-core-koreaworkshop.git
```


*if you encounter any problem with the installation, please look for Yuk Kei (likely in a red hoodie and a yellow backpack) after the talks on Jan 31. between 17:20-18:00. We will set up a table at KOGO for potential troubleshooting.*

## Running the pipeline

We will use the following samplesheet.csv for the pipeline:
```
wget https://raw.githubusercontent.com/yuukiiwa/nf-core-koreaworkshop/master/samplesheet.csv
```

We will use the following samples for the pipeline:
```
wget https://github.com/nf-core/test-datasets/blob/nanoseq/reference/GRCh38_EDIL3.fa 
```
You can run the pipeline with the following command:
```
./nextflow nf-core-koreaworkshop/main.nf --input nf-core-koreaworkshop/samplesheet.csv --outdir output --fasta GRCh38_EDIL3.fa -profile docker
```
When the pipeline is done running, it should look like the following:
![Screenshot from 2024-01-04 09-55-56](https://github.com/yuukiiwa/nf-core-koreaworkshop/assets/41866052/3c20437f-c491-40b0-990d-91e25cefdff6)


## Support

If you missed the workshop or were not able to be in KOGO or need more clarification after the KOGO workshop, the nf-core outreach team will organize 90-min, small-group zoom training sessions on nextflow. Please stay tuned for the dates we will be holding the zoom training sessions.

## Credits

nf-core/koreaworkshop was originally written by Yuk Kei Wan.

> **The nf-core framework for community-curated bioinformatics pipelines.**
>
> Philip Ewels, Alexander Peltzer, Sven Fillinger, Harshil Patel, Johannes Alneberg, Andreas Wilm, Maxime Ulysse Garcia, Paolo Di Tommaso & Sven Nahnsen.
>
> _Nat Biotechnol._ 2020 Feb 13. doi: [10.1038/s41587-020-0439-x](https://dx.doi.org/10.1038/s41587-020-0439-x).
>
