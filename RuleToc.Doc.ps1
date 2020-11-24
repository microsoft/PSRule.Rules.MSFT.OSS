# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

Document 'module' {
    Title 'Rules by category'

    Import-Module .\out\modules\PSRule.Rules.MSFT.OSS
    $rules = Get-PSRule -Module PSRule.Rules.MSFT.OSS -WarningAction SilentlyContinue |
        Add-Member -MemberType ScriptProperty -Name Category -Value { $this.Info.Annotations.category } -PassThru |
        Sort-Object -Property Category;

    Section 'Rules' {
        'The following rules are included within `PSRule.Rules.MSFT.OSS`.'

        $categories = $rules | Group-Object -Property Category;

        foreach ($category in $categories) {
            Section "$($category.Name)" {
                $category.Group |
                    Sort-Object -Property RuleName |
                    Table -Property @{ Name = 'Name'; Expression = {
                        "[$($_.RuleName)]($($_.RuleName).md)"
                    }}, Synopsis
            }
        }
    }
}
