Add-Type -assembly System.Windows.Forms
Add-Type -assembly System.Drawing


function showScriptDir {
    $ScriptDir = Split-Path $script:MyInvocation.MyCommand.Path
	return $ScriptDir
}

$filename = $args[0]
$file_path = $args[1]

Write-Host $file_path

$start_form = New-Object System.Windows.Forms.Form
$start_form.Text = 'Copy file'
$start_form.Size = New-Object System.Drawing.Size(400,150)
$start_form.StartPosition = 'CenterScreen'
$start_form.FormBorderStyle = 'FixedDialog'
$start_form.MinimizeBox = $False
$start_form.MaximizeBox = $False

$fileLabel = New-Object System.Windows.Forms.Label
$fileLabel.Location = New-Object System.Drawing.Point(50,5)
$fileLabel.Size = New-Object System.Drawing.Size(350,25)
$fileLabel.Text = "Copy <$filename> to "
$fileLabel.Font = New-Object System.Drawing.Font("Arial",8)
$start_form.Controls.Add($fileLabel)


$pathBoxUp = New-Object System.Windows.Forms.TextBox
$pathBoxUp.Location = New-Object System.Drawing.Point(15, 30)
$pathBoxUp.Size = New-Object System.Drawing.Size(10, 20)
$pathBoxUp.Width = 350
$pathBoxUp.Text = pwd
$start_form.Controls.Add($pathBoxUp)

$okButton = New-Object System.Windows.Forms.Button
$okButton.Location = New-Object System.Drawing.Point(10,80)
$okButton.Size = New-Object System.Drawing.Size(90,23)
$okButton.Text = 'OK'
$start_form.Controls.Add($okButton)

$cancelButton = New-Object System.Windows.Forms.Button
$cancelButton.Location = New-Object System.Drawing.Point(120,80)
$cancelButton.Size = New-Object System.Drawing.Size(90,23)
$cancelButton.Text = 'Cancel'
$start_form.Controls.Add($cancelButton)

$okButton.Add_Click(
{   
    Copy-Item $file_path -Destination $pathBoxUp.Text
	[System.Windows.Forms.MessageBox]::Show("Succesful copied" , "Copy result")
    $start_form.Close()
}
)
$cancelButton.Add_click(
{
    $start_form.Close()
}
)
$result = $start_form.ShowDialog()