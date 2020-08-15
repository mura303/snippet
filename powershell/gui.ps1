using namespace System.Windows.Forms
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing
 
[Application]::EnableVisualStyles()
 
# ラベル
$label = New-Object Label
$label.Text = "Hello World!"
$label.Name = "Label1"
$label.Font = New-Object Drawing.Font("Meiryo UI",26)
$label.Location = "50, 22"
$label.AutoSize = $True
 
# ボタン
$btn = New-Object Button
$btn.Text = "OK"
$btn.Font = New-Object Drawing.Font("Meiryo UI",18)
$btn.Size = "120, 40"
$btn.Location = "120, 90"
 
# ボタンイベント
$btn_Click = {
  ($sender, $e) = $this, $_
  $parent = ($sender -as [Button]).Parent -as [Form]
  $label = [Label]$parent.Controls["Label1"];
  $label.Text = "Hello PowerShell!"
  $label.Location = "30, 22"
}
$btn.Add_Click($btn_Click)
 
# フォーム
$frame = New-Object Form
$frame.Text = "Hello PowerShell"
$frame.Size = "380, 200"
$frame.Controls.AddRange(@($label, $btn))
$frame.ShowDialog()

