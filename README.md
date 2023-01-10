# herdstat-action

[![stability-wip](https://img.shields.io/badge/stability-wip-lightgrey.svg)](https://github.com/mkenney/software-guides/blob/master/STABILITY-BADGES.md#work-in-progress)
[![Conventional Commits](https://img.shields.io/badge/Conventional%20Commits-1.0.0-%23FE5196?logo=conventionalcommits&logoColor=white)](https://conventionalcommits.org)
[![pre-commit](https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit&logoColor=white)](https://github.com/pre-commit/pre-commit)

> **Warning** `herdstat-action` is work in progress and neither feature complete nor tested thoroughly.

`herdstat-action` is a GitHub action for analyzing the community around open source projects. For more details see the
[herdstat repository][herdstat]

## Usage

### Configuration

Create a `.herdstat.yaml` file at the root of your repository with the following content

```yaml
repositories:
  - <owner>/<repo>
```

This is a minimal configuration. For a full reference on all available options see the `herdstat` [README][herdstat] and
the [.herdstat.reference.yaml][herdstat-ref].

### Workflow

A sample workflow that generates a contribution graph daily at midnight and stores the resulting graph in the repository
looks as follows:

```yaml
on:
  schedule:
    # Runs every at midnight
    - cron: '0 0 * * *'
jobs:
  herdstat:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - uses: herdstat/herdstat-action@v0.3.0
        env:
          GITHUB_TOKEN: ${{ github.token }}
      - uses: EndBug/add-and-commit@v9
        with:
          default_author: github_actions
          add: 'contribution-graph.svg'
          message: 'Update contribution graph'
```

Note that we provide the GitHub token to the action by means of the `GITHUB_TOKEN` environment variable to avoid rate
limiting issues for unauthenticated API calls.

You can see that workflow in action in the [herdstat/.github](https://github.com/herdstat/.github) repository. The graph
is included in the [herdstat organization profile](https://github.com/herdstat).

[herdstat]: https://github.com/herdstat/herdstat/
[herdstat-ref]: https://github.com/herdstat/herdstat/blob/main/.herdstat.reference.yaml
