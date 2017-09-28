<#SDS Modified Pester Test file header to handle modules.#>
$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$sut = ( (Split-Path -Leaf $MyInvocation.MyCommand.Path) -replace '\.Tests\.', '.' ) -replace '.ps1', '.psd1'
$scriptBody = "using module $here\$sut"
$script = [ScriptBlock]::Create($scriptBody)
. $script

#region Describe "Update-TextInNotepad" 
Describe "Update-TextInNotepad" {
    It "If you pass in 'text' through the pipeline, you get back 'text' (mocking out notepad)" {
        MOCK Start-Process {} -Verifiable -ModuleName Update-TextInNotepad
        'text' | Update-TextInNotepad | Should Be 'text'}

    It "If you pass in 'text' positionally, you get back 'text' (mocking out notepad)" {
        MOCK Start-Process {} -Verifiable -ModuleName Update-TextInNotepad
        Update-TextInNotepad 'text' | Should Be 'text'}

    It "If you pass in 'text' by named parameter, you get back 'text' (mocking out notepad)" {
        MOCK Start-Process {} -Verifiable -ModuleName Update-TextInNotepad
        Update-TextInNotepad -Text 'text' | Should Be 'text'}

    It "It calls Start-Process" {
        MOCK Start-Process {} -Verifiable -ModuleName Update-TextInNotepad
        Update-TextInNotepad 'text'
        Assert-VerifiableMocks}

}
#endregion Describe "Update-TextInNotepad" 
