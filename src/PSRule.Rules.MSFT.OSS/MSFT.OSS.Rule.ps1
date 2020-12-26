# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

# Synopsis: Check for recommended community files
Rule 'MSFT.OSS.Community' -Type 'PSRule.Data.RepositoryInfo' {
    $Assert.FilePath($TargetObject, 'FullName', @('LICENSE'));
    $Assert.FilePath($TargetObject, 'FullName', @('CODE_OF_CONDUCT.md'));
    $Assert.FilePath($TargetObject, 'FullName', @('CONTRIBUTING.md'));
    $Assert.FilePath($TargetObject, 'FullName', @('SECURITY.md'));
    $Assert.FilePath($TargetObject, 'FullName', @('README.md'));
    $Assert.FilePath($TargetObject, 'FullName', @('.github/CODEOWNERS'));
    $Assert.FilePath($TargetObject, 'FullName', @('.github/PULL_REQUEST_TEMPLATE.md'));
}

# Synopsis: Check for license in code files
Rule 'MSFT.OSS.License' -Type '.cs', '.ps1', '.psd1', '.psm1', '.ts', '.js', '.fs', '.go', '.php', '.cpp', '.h', '.r', '.py', '.sh', '.pl' {
    $Assert.FileHeader($TargetObject, 'FullName', @(
        'Copyright (c) Microsoft Corporation.'
        'Licensed under the MIT License.'
    ));
}
