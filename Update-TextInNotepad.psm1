
#region
function Update-TextInNotepad {
[OutputType(‘System.String’)]
<#
.SYNOPSIS
Update-TextInNotepad is for interactive use only, and only for those weird cases when you have a compelling reason to edit some text on the fly.
.OUTPUTS
String
#>
PARAM([Parameter(ValueFromPipeline=$true)][String]$Text)
    $tf = New-TemporaryFile; $Text > $tf ; Start-Process "Notepad.exe" -ArgumentList $tf -Wait ; Get-Content $tf; Remove-Item $tf
}
#endregion function Update-TextInNotepad
