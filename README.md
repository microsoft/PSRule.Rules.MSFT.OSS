# PSRule for Microsoft OSS

A suite of rules to validate repositories against Microsoft Open Source Software (OSS) requirements.
This module is intended to be used by Microsoft repositories, and also serves as a functional example.

![ci-badge]

## Support

This project uses GitHub Issues to track bugs and feature requests.
Please search the existing issues before filing new issues to avoid duplicates.

- For new issues, file your bug or feature request as a new [issue].
- For help, discussion, and support questions about using this project, join or start a [discussion].

If you have any problems with the [PSRule][engine] engine, please check the project GitHub [issues](https://github.com/Microsoft/PSRule/issues) page instead.

Support for this project/ product is limited to the resources listed above.

## Getting started

### Using with GitHub Actions

1. See [Creating a workflow file][create-workflow].
2. Reference `Microsoft/ps-rule` with `modules: 'PSRule.Rules.MSFT.OSS'`
3. Optionally, set option `prerelease: true` to use a pre-release version.

For example:

```yaml
# Example: .github/workflows/analyze.yaml

#
# Repository validation
#
name: Analyze
on:
- pull_request
jobs:
  analyze:
    name: Analyze repository
    runs-on: ubuntu-latest
    steps:

    - name: Checkout
      uses: actions/checkout@v2

    # Run analysis against repository
    - name: Run PSRule analysis
      uses: Microsoft/ps-rule@main
      with:
        modules: 'PSRule.Rules.MSFT.OSS'
        prerelease: true
```

## Manual install

This project is designed to be run through a continuous integration (CI) pipeline using GitHub Actions.

Additionally, this module can be manually installed from the [PowerShell Gallery][module].
For manual installation see [instructions][install].

## Changes and versioning

Modules in this repository will use the [semantic versioning](http://semver.org/) model to declare breaking changes from v1.0.0.
Prior to v1.0.0, breaking changes may be introduced in minor (0.x.0) version increments.
For a list of module changes please see the [change log](CHANGELOG.md).

> Pre-release module versions are created on major commits and can be installed from the PowerShell Gallery.
> Pre-release versions should be considered experimental.
> Modules and change log details for pre-releases will be removed as standard releases are made available.

## Contributing

This project welcomes contributions and suggestions.
If you are ready to contribute, please visit the [contribution guide](CONTRIBUTING.md).

## Code of Conduct

This project has adopted the [Microsoft Open Source Code of Conduct](https://opensource.microsoft.com/codeofconduct/).
For more information see the [Code of Conduct FAQ](https://opensource.microsoft.com/codeofconduct/faq/)
or contact [opencode@microsoft.com](mailto:opencode@microsoft.com) with any additional questions or comments.

## Maintainers

- [Bernie White](https://github.com/BernieWhite)

## License

This project is [licensed under the MIT License](LICENSE).

[issue]: https://github.com/Microsoft/PSRule.Rules.MSFT.OSS/issues
[discussion]: https://github.com/microsoft/PSRule.Rules.MSFT.OSS/discussions
[install]: docs/install-instructions.md
[ci-badge]: https://dev.azure.com/bewhite/PSRule.Rules.MSFT.OSS/_apis/build/status/PSRule.Rules.MSFT.OSS-CI?branchName=main
[module]: https://www.powershellgallery.com/packages/PSRule.Rules.MSFT.OSS
[engine]: https://github.com/Microsoft/PSRule
[create-workflow]: https://help.github.com/en/articles/configuring-a-workflow#creating-a-workflow-file
