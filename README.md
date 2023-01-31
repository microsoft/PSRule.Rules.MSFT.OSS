# PSRule for Microsoft OSS

A suite of rules to validate repositories against Microsoft Open Source Software (OSS) requirements.
This module is intended to be used by Microsoft repositories, and also serves as a functional example.

[![Open in vscode.dev](https://img.shields.io/badge/Open%20in-vscode.dev-blue)][1]

## Support

This project uses GitHub Issues to track bugs and feature requests.
Please search the existing issues before filing new issues to avoid duplicates.

- For new issues, file your bug or feature request as a new [issue][2].
- For help, discussion, and support questions about using this project, join or start a [discussion][3].

If you have any problems with the [PSRule][4] engine,
please check the project GitHub [issues][5] page instead.

Support for this project/ product is limited to the resources listed above.

  [1]: https://vscode.dev/github/microsoft/PSRule.Rules.MSFT.OSS
  [2]: https://github.com/microsoft/PSRule.Rules.MSFT.OSS/issues
  [3]: https://github.com/microsoft/PSRule.Rules.MSFT.OSS/discussions
  [4]: https://github.com/microsoft/PSRule
  [5]: https://github.com/microsoft/PSRule/issues

## Getting started

### Using with GitHub Actions

1. See [Creating a workflow file][6].
2. Reference `microsoft/ps-rule` with `modules: 'PSRule.Rules.MSFT.OSS'`
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
      uses: actions/checkout@v3

    # Run analysis against repository
    - name: Run PSRule analysis
      uses: microsoft/ps-rule@v2.7.0
      with:
        modules: 'PSRule.Rules.MSFT.OSS'
        prerelease: true
```

  [6]: https://docs.github.com/actions/using-workflows#creating-a-workflow-file

## Manual install

This project is designed to be run through a continuous integration (CI) pipeline using GitHub Actions.

Additionally, this module can be manually installed from the [PowerShell Gallery][7].
For manual installation see [instructions][8].

  [7]: https://www.powershellgallery.com/packages/PSRule.Rules.MSFT.OSS
  [8]: docs/install-instructions.md

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
