Add-Type -AssemblyName PresentationFramework

# 画面定義
[xml]$xaml = @'
<Window xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation" 
  xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
  Title="選択"
  Width="300" Height="200" ResizeMode="Noresize">
    <Window.Resources>
        <!-- 共通スタイル定義 -->
        <Style TargetType="RadioButton">
            <Setter Property="Margin" Value="5"/>
        </Style>
        <Style TargetType="Button">
            <Setter Property="Margin" Value="10"/>
            <Setter Property="Width" Value="100"/>
        </Style>
    </Window.Resources>

    <Grid FocusManager.FocusedElement="{Binding ElementName=firstRadio}">
        <Grid.RowDefinitions>
            <RowDefinition/>
            <RowDefinition Height="Auto"/>
        </Grid.RowDefinitions>

        <StackPanel Name="radiosContainer">
            <TextBlock Text="以下の選択肢から好きな果物を選択してください。" Margin="5"/>
            <RadioButton Content="リンゴ" Name="firstRadio" IsChecked="True"/>
            <RadioButton Content="キウイ"/>
            <RadioButton Content="パイナップル"/>
        </StackPanel>

        <StackPanel Orientation="Horizontal" Grid.Row="1">
            <Button Content="OK" Name="okBtn" IsDefault="True"/>
            <Button Content="キャンセル" Name="cancelBtn" IsCancel="True"/>
        </StackPanel>
    </Grid>
</Window>
'@

$reader = (New-Object System.Xml.XmlNodeReader $xaml)
$window = [Windows.Markup.XamlReader]::Load($reader)

$radios = $window.FindName('radiosContainer')
$okBtn = $window.FindName('okBtn')
$cancelBtn = $window.FindName('cancelBtn')

[string]$script:selectedRadio = ''

# OKボタン押下時の処理
$okBtn.add_Click.Invoke({
    foreach ($item in $radios.Children) {
        if ([string]$item.GetType() -ne 'System.Windows.Controls.RadioButton') {
            continue
        }
        if ($item.IsChecked) {
            # 選択されたラジオボタンのContentを保存
            $script:selectedRadio = $item.Content
            break
        }
    }
  # ウィンドウを閉じる
  $window.Close()
})

# キャンセルボタン押下時の処理
$cancelBtn.add_Click.Invoke({
  # ウィンドウを閉じる
  $window.Close()
})

# ウィンドウ表示
$window.ShowDialog() > $null

# 結果表示
if ($selectedRadio) {
    Write-Host "${selectedRadio}が選択されました。"
} else {
    Write-Host "キャンセルされました。"
}