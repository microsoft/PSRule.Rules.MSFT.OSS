# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

# Synopsis: Check for recommended community files
Rule 'MSFT.OSS.Community' -Type 'PSRule.Data.RepositoryInfo' {
    $Assert.FilePath($TargetObject, 'FullName', @('LICENSE', 'LICENSE.txt'));
    $Assert.FilePath($TargetObject, 'FullName', @('CODE_OF_CONDUCT.md'));
    $Assert.FilePath($TargetObject, 'FullName', @('CONTRIBUTING.md'));
    $Assert.FilePath($TargetObject, 'FullName', @('SECURITY.md'));
    $Assert.FilePath($TargetObject, 'FullName', @('SUPPORT.md'));
    $Assert.FilePath($TargetObject, 'FullName', @('README.md'));
    $Assert.FilePath($TargetObject, 'FullName', @('.github/CODEOWNERS'));
    $Assert.FilePath($TargetObject, 'FullName', @('.github/PULL_REQUEST_TEMPLATE.md'));
}

# Synopsis: Check for license in code files
Rule 'MSFT.OSS.License' -Type '.cs', '.ps1', '.psd1', '.psm1', '.ts', '.js', '.fs', '.go', '.php', '.cpp', '.h', '.r', '.rb', '.py', '.sh', '.pl', '.bicep', 'Dockerfile', '.bat', '.cmd' {
    $Assert.FileHeader($TargetObject, 'FullName', @(
        'Copyright (c) Microsoft Corporation.'
        'Licensed under the MIT License.'
    ));
}
