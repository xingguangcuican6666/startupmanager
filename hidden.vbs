If WScript.Arguments.Count < 1 Then
    WScript.Echo "Usage: hidden.vbs <batch_file>"
    WScript.Quit
End If

batchFile = WScript.Arguments(0)

Set WshShell = CreateObject("WScript.Shell")
WshShell.Run "cmd /c """ & batchFile & """", 0, True
Set WshShell = Nothing
