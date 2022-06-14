#$CertificatePassword="Imag3nCDDAc0n3x2022"
#$CertificatePassword="C0llahuas1CDDInt3gr@c1on3s2022"
$CertificatePassword="C0lbun.Int3gr@ci0nPV.2022"
$Tenant="fc9f30fb-f690-4c42-bbc6-d99cb95218fa"
$CertificateOutDir = ".\Certificates"
if (-not ( Test-Path -Path $CertificateOutDir -PathType Container )) {
	md $CertificateOutDir
}
$app = Register-PnPAzureADApp -ApplicationName "CertQAPortalVirtual" -Tenant $Tenant -OutPath $CertificateOutDir `
	-CertificatePassword (ConvertTo-SecureString -String $CertificatePassword -AsPlainText -Force) `
	-Scopes "SPO.Sites.FullControl.All" `
	-Store CurrentUser -DeviceLogin
Write-Host $app.'AzureAppId/ClientId'
Write-Host $app.'Certificate Thumbprint'