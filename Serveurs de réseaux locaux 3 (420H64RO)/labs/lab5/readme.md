# [Laboratoire 5](../../labs%20pdf/Laboratoire-5.pdf)

## Préparation 
1. Server Windows 2022 DataCenter avec **AD,DHCP,DNS** 
    - FQDN : SRVAD
    - IP 10.10.10.10
2. Server Windows 2022 DataCenter avec **WDS**
    - FQDN : SRVWDS
    - IP 10.10.10.20
    - 2 Partition: Windows et WDS
    - Joindre au domain

## Partie 1
[Lien pour tutorial WDS](https://rdr-it.com/wds-installation-et-configuration/#introduction)<br>
[Lien pour tutorial MDT](https://rdr-it.com/deployer-windows-avec-mdt-et-wds/8/)<br>
[Installer ADK](https://learn.microsoft.com/en-us/windows-hardware/get-started/adk-install)
Version 22h stable <br>
[ADK](https://go.microsoft.com/fwlink/?linkid=2196127)<br>
[WIN PE](https://go.microsoft.com/fwlink/?linkid=2196224)
[MDT](https://www.microsoft.com/en-us/download/details.aspx?id=54259)

1. Configuration DHCP
    ![alt text](pics/DHCP.jpg)

2. Configuation DNS
    ![alt text](pics/DNS.jpg)

3. Configuration WDS
    Ouvrir WDS
    ![alt text](pics/screen0.0.jpg)

    Configurer quelques options de WDS Server
    ![alt text](pics/screen0.1.jpg)
    ![alt text](pics/screen0.2.jpg)
    ![alt text](pics/screen0.3.jpg)

4. Avoir le boot.wim et install.wim de l'ISO que vous voulez
    - 1. Télécharger l'iso
    - 2. Monter l'iso dans votre machine
    - 3. /sources/install.wim et /sources/boot.wim<br>
    *si vous trouve pas .wim mais .esd vous pouvez le convertir [ici](https://rdr-it.com/convertir-un-fichier-esd-en-wim/)*
    - 4. Mets le install.wim et boot.wim dans la partion WDS<br>
    *rien a faire apres pour le moment*

5. Configuration MDT
    ![alt text](pics/screen1.jpg)<br>
    Creation du share
    ![alt text](pics/screen2.jpg)
    ![alt text](pics/screen2.jpg)
    ![alt text](pics/screen3.jpg)
    ![alt text](pics/screen4.jpg)
    ![alt text](pics/screen5.jpg)
    ![alt text](pics/screen6.jpg)
    ![alt text](pics/screen7.jpg)<br>
    X64 SEULMENT
    ![alt text](pics/screen8.jpg)
    ![alt text](pics/screen9.jpg)<br>
    Décocher generate iso image
    ![alt text](pics/screen10.jpg)
    ![alt text](pics/screen11.jpg)<br>
    Ajouter l'OS
    ![alt text](pics/screen12.jpg)
    ![alt text](pics/screen13.jpg)
    ![alt text](pics/screen14.jpg)
    ![alt text](pics/screen15.jpg)
    ![alt text](pics/screen16.jpg)
    ![alt text](pics/screen17.jpg)
    ![alt text](pics/screen18.jpg)
    ![alt text](pics/screen19.jpg)
    ![alt text](pics/screen20.jpg)
    ![alt text](pics/screen21.jpg)
    ![alt text](pics/screen22.jpg)<br>
    Ajouter task sequence
    ![alt text](pics/screen23.jpg)
    ![alt text](pics/screen24.jpg)
    ![alt text](pics/screen25.jpg)
    ![alt text](pics/screen26.jpg)
    ![alt text](pics/screen27.jpg)
    ![alt text](pics/screen28.jpg)
    ![alt text](pics/screen29.jpg)
    ![alt text](pics/screen30.jpg)
    ![alt text](pics/screen31.jpg)
    ![alt text](pics/screen32.jpg)<br>
    Regenerate boot
    ![alt text](pics/screen33.jpg)
    ![alt text](pics/screen34.jpg)
    ![alt text](pics/screen35.jpg)
    ![alt text](pics/screen36.0.jpg)<br>
    **Import ce lite.wim dans wds**
    ![alt text](pics/screen36.1.jpg)
    ![alt text](pics/screen36.2.jpg)
    ![alt text](pics/screen36.3.jpg)
    ![alt text](pics/screen36.4.jpg)
    ![alt text](pics/screen36.5.jpg)
    ![alt text](pics/screen36.6.jpg)
    **Finir le deployment manual**
    ![alt text](pics/vmmdt1.jpg)
    ![alt text](pics/vmmdt2.jpg)
## Partie 2

1. Deployment automatisé<br>
    Doit modifer le ficher customsettings.ini et Boostrap.ini ou le xml.
    ![alt text](pics/screen37.jpg)
    ![alt text](pics/screen38.jpg)<br>
    Path
    ![alt text](pics/screen39.jpg)<br>
    **Utilisé vbscript pour tester la config sans lancer une vm.**
    ![alt text](pics/screen40.jpg)
    ![alt text](pics/screen41.jpg)

2. Voici mes fichers

    [Customsettings.ini](CustomSettings.ini)<br>
    [Boostrap.ini](Bootstrap.ini)<br>
    [Demo vid](demo.mp4)
    <video controls src="demo.mp4" title="Title"></video>