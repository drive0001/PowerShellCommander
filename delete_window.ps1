Add-Type -assembly System.Windows.Forms
Add-Type -assembly System.Drawing


$filename = $args[0]
$file_path = $args[1]


$start_form = New-Object System.Windows.Forms.Form
$start_form.Text = 'Delete file'
$start_form.Size = New-Object System.Drawing.Size(350,150)
$start_form.StartPosition = 'CenterScreen'
$start_form.FormBorderStyle = 'FixedDialog'
$start_form.MinimizeBox = $False
$start_form.MaximizeBox = $False

$Label = New-Object System.Windows.Forms.Label
$Label.Location = New-Object System.Drawing.Point(10,15)
$Label.Size = New-Object System.Drawing.Size(350,25)
$Label.Text = "Are you sure to remove <$filename> to bin? "
$Label.Font = New-Object System.Drawing.Font("Arial",8)
$start_form.Controls.Add($Label)


$okButton = New-Object System.Windows.Forms.Button
$okButton.Location = New-Object System.Drawing.Point(10,80)
$okButton.Size = New-Object System.Drawing.Size(90,23)
$okButton.Text = 'OK'
$start_form.Controls.Add($okButton)

$cancelButton = New-Object System.Windows.Forms.Button
$cancelButton.Location = New-Object System.Drawing.Point(180,80)
$cancelButton.Size = New-Object System.Drawing.Size(90,23)
$cancelButton.Text = 'Cancel'
$start_form.Controls.Add($cancelButton)

$okButton.Add_Click(
{   
    Remove-Item –path $file_path
    #todo check if file is directory 
	[System.Windows.Forms.MessageBox]::Show("Succesful deleted" ,"Delete result")
    $start_form.Close()
}
)
$cancelButton.Add_click(
{
    $start_form.Close()
}
)



$result = $start_form.ShowDialog()