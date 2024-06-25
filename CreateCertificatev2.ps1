$certname = "{certName}"    ## Replace {certificateName}
$cert = New-SelfSignedCertificate -Subject "CN=$certname" -CertStoreLocation "Cert:\CurrentUser\My" -KeyExportPolicy Exportable -KeySpec Signature -KeyLength 2048 -KeyAlgorithm RSA -HashAlgorithm SHA256
Export-Certificate -Cert $cert -FilePath "C:\Certificates\$certname.cer"   ## Specify your preferred location
$mypwd = ConvertTo-SecureString -String "{password}" -Force -AsPlainText  ## Replace {myPassword}
Export-PfxCertificate -Cert $cert -FilePath "C:\Certificates\$certname.pfx" -Password $mypwd   ## Specify your preferred location
