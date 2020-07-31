# Docker Containers

This repository builds various docker images relevant to projects in [fastai](https://github.com/fastai/) on a recurring schedule [defined in this repo's workflow files](.github/workflows/).  Some familiarity with Docker is assumed.  For a gentle introduction to Docker, see [this blog post](https://towardsdatascience.com/how-docker-can-help-you-become-a-more-effective-data-scientist-7fc048ef91d5).


# Projects

## [fastai2](https://github.com/fastai/fastai2)

![Build fastai2 images](https://github.com/fastai/docker-containers/workflows/Build%20fastai2%20images/badge.svg)

These images are built on top of [nvidia official CUDA images](https://hub.docker.com/r/nvidia/cuda/).  You can see the version of CUDA by looking at [the Dockerfile](fastai2-build/Dockerfile).  Furthermore, fastai2 is installed with [miniconda](https://docs.conda.io/en/latest/miniconda.html), as using conda is the [recommended way](https://github.com/fastai/fastai2#installing) to install fastai2 dependencies.

- [fastai2](https://hub.docker.com/repository/docker/fastdotai/fastai2): comes installed with fastai2 and fastcore from pypi.

- [fastai2-dev](https://hub.docker.com/repository/docker/fastdotai/fastai2-dev): 
comes installed with an editable install of fastai2 and fastcore each project's GitHub repos, along with the latest release nbdev.  The editable installs for fastai and fastcore are located in `/home/docker-fastai2/fastai2` and `/home/docker-fastai2/fastcore`, respectively.

<details>
  <summary>Expand for more details</summary>

#### Tags

These images have the following available tags:

- `latest`: the most current build
- `version`: corresponds to the version of fastai2
- `SHA`: corresponds to the GITHUB SHA of this repo when the image was built.

#### Usage

If you have a Nvdia GPU that is compatible with CUDA 10 or higher, you should [install Nvidia Docker](https://github.com/NVIDIA/nvidia-docker).  Afterwards, you will need to use the `--gpus` flag when running the container.  See the [usage](https://github.com/NVIDIA/nvidia-docker#usage) section for more details on the various arguments available. 

#### Examples:

 - Run a jupyter server with all GPUs
    > docker run --gpus all 
    
- Run a jupyter server with 2 GPUs on with an editable install
    > docker run --gpus '"device=1,2"'

- Run a jupyter server with 2 GPUs on with an editable install for version fastai 0.0.22
    > docker run --gpus '"device=1,2"'

- Run an interacive shell on CPUs on the latest version of fastai2
    > docker run -it fastdotai/fastai2:latest bash

</details>