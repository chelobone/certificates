#$CertificatePassword="Imag3nCDDAc0n3x2022"
#$CertificatePassword="C0llahuas1CDDInt3gr@c1on3s2022"
$CertificatePassword=""
$Tenant=""
$CertificateOutDir = ".\Certificates"
if (-not ( Test-Path -Path $CertificateOutDir -PathType Container )) {
	md $CertificateOutDir
}
$app = Register-PnPAzureADApp -ApplicationName "" -Tenant $Tenant -OutPath $CertificateOutDir `
	-CertificatePassword (ConvertTo-SecureString -String $CertificatePassword -AsPlainText -Force) `
	-Scopes "SPO.Sites.FullControl.All" `
	-Store CurrentUser -DeviceLogin
Write-Host $app.'AzureAppId/ClientId'
Write-Host $app.'Certificate Thumbprint'
