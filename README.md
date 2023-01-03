# herdstat-action

[![stability-wip](https://img.shields.io/badge/stability-wip-lightgrey.svg)](https://github.com/mkenney/software-guides/blob/master/STABILITY-BADGES.md#work-in-progress)
[![Conventional Commits](https://img.shields.io/badge/Conventional%20Commits-1.0.0-%23FE5196?logo=conventionalcommits&logoColor=white)](https://conventionalcommits.org)

> **Warning**
> `herdstat-action` is work in progress and neither feature complete nor tested thoroughly.

`herdstat-action` is a GitHub action for analyzing the community around open
source projects. For more details see the [herdstat repository][herdstat]

[herdstat]: https://github.com/herdstat/herdstat/

## Usage

### Configuration

Create a `.herdstat.yaml` file at the root of your repository with the
following content

```yaml
repositories:
  - <owner>/<repo> 
```

This is a minimal configuration. For a full reference on all available options
see [.herdstat.reference.yaml][herdstat-ref].

[herdstat-ref]: https://github.com/herdstat/herdstat/blob/main/.herdstat.reference.yaml

### Workflow

```yaml
on:
  workflow_dispatch:
jobs:
  herdstat:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v3
    - uses: herdstat/herdstat-action@v0.1.0
```
