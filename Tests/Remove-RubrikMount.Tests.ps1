Remove-Module -Name 'Rubrik' -ErrorAction 'SilentlyContinue'
Import-Module -Name './Rubrik/Rubrik.psd1' -Force

foreach ( $privateFunctionFilePath in ( Get-ChildItem -Path './Rubrik/Private' | Where-Object extension -eq '.ps1').FullName  ) {
    . $privateFunctionFilePath
}

Describe -Name 'Public/Remove-RubrikMount' -Tag 'Public', 'Remove-RubrikMount' -Fixture {
    #region init
    $global:rubrikConnection = @{
        id      = 'test-id'
        userId  = 'test-userId'
        token   = 'test-token'
        server  = 'test-server'
        header  = @{ 'Authorization' = 'Bearer test-authorization' }
        time    = (Get-Date)
        api     = 'v1'
        version = '4.0.5'
    }
    #endregion

    Context -Name 'Parameter Validation' {
        Mock -CommandName Test-RubrikConnection -Verifiable -ModuleName 'Rubrik' -MockWith {}
        Mock -CommandName Submit-Request -Verifiable -ModuleName 'Rubrik' -MockWith {
            @{
                'id'       = 'UNMOUNT_SNAPSHOT_11111'
                'status'   = 'QUEUED'
                'progress' = '0'
            }
        }

        It -Name 'Should remove mount with QUEUED' -Test {
            ( Remove-RubrikMount -Id 'snapshotid').status |
                Should -BeExactly 'QUEUED'
        }
        
        It -Name 'Parameter id is missing' -Test {
            { Remove-RubrikMount -Id  } |
                Should -Throw "Missing an argument for parameter 'Id'. Specify a parameter of type 'System.String' and try again."
        }
        It -Name 'Parameter id is empty' -Test {
            { Remove-RubrikMount -id ''  } |
                Should -Throw "Cannot bind argument to parameter 'Id' because it is an empty string."
        }
        Assert-VerifiableMock
        Assert-MockCalled -CommandName Test-RubrikConnection -ModuleName 'Rubrik' -Exactly 1
        Assert-MockCalled -CommandName Submit-Request -ModuleName 'Rubrik' -Exactly 1
    }
}