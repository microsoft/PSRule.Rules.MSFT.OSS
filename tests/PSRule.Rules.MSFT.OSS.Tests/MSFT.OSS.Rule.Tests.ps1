# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

#
# Unit tests for OSS rules
#

[CmdletBinding()]
param ()

# Setup error handling
$ErrorActionPreference = 'Stop';
Set-StrictMode -Version latest;

if ($Env:SYSTEM_DEBUG -eq 'true') {
    $VerbosePreference = 'Continue';
}

# Setup tests paths
$rootPath = $PWD;
Import-Module (Join-Path -Path $rootPath -ChildPath out/modules/PSRule.Rules.MSFT.OSS) -Force;
$here = Join-Path -Path $rootPath -ChildPath 'tests/PSRule.Rules.MSFT.OSS.Tests/';

Describe 'MSFT.OSS' -Tag 'name' {
    $invokeParams = @{
        Module = 'PSRule.Rules.MSFT.OSS'
        WarningAction = 'Ignore'
        ErrorAction = 'Stop'
        Format = 'File'
    }

    Context 'MSFT.OSS.Community' {
        It 'Self' {
            $ruleResult = @(Invoke-PSRule @invokeParams -InputPath $rootPath -Name 'MSFT.OSS.Community');
            $ruleResult | Should -Not -BeNullOrEmpty;
            $ruleResult.Length | Should -Be 1;
            $ruleResult.Outcome | Should -BeIn 'Pass';
        }
    }

    Context 'MSFT.OSS.License' {
        It 'Self' {
            $ruleResult = @(Invoke-PSRule @invokeParams -InputPath $rootPath -Name 'MSFT.OSS.License');
            $ruleResult | Should -Not -BeNullOrEmpty;
            $ruleResult.Outcome | Should -BeIn 'Pass';
        }

        It 'Missing header' {
            # Prepare files
            $testPath = Join-Path -Path $rootPath -ChildPath 'out/tests/headers/';
            if (!(Test-Path -Path $testPath)) {
                $Null = New-Item -Path $testPath -ItemType Directory -Force;
            }
            $extentionsSlash = @('.cs', '.ts', '.js', '.fs', '.go', '.php', '.cpp', '.h')
            $extentionsHash = @('.ps1')
            foreach ($ext in $extentionsSlash) {
                $Null = Set-Content -Path (Join-Path -Path $testPath -ChildPath "file$ext") -Value '// An example value';
            }
            foreach ($ext in $extentionsHash) {
                $Null = Set-Content -Path (Join-Path -Path $testPath -ChildPath "file$ext") -Value '`# An example value';
            }

            # Check rule
            Set-Location -Path $testPath;
            try {
                $ruleResult = @(Invoke-PSRule @invokeParams -InputPath $testPath -Name 'MSFT.OSS.License');
                $ruleResult | Should -Not -BeNullOrEmpty;
                $ruleResult.Length | Should -Be ($extentionsSlash.Length + $extentionsHash.Length);
                $ruleResult.Outcome | Should -BeIn 'Fail';
            }
            finally {
                Pop-Location;
            }
        }
    }
}
