# [Laboratoire 4](<../../labs pdf/Laboratoire-4.pdf>)

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
[Lien pour tutorial](https://rdr-it.com/wds-installation-et-configuration/#introduction)<br>
[Installer ADK](https://learn.microsoft.com/en-us/windows-hardware/get-started/adk-install)
Version 22h stable <br>
[ADK](https://go.microsoft.com/fwlink/?linkid=2196127)<br>
[WIN PE](https://go.microsoft.com/fwlink/?linkid=2196224)

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
    - 4. Mets le install.wim et boot.wim dans la partion WDS

5. Ajouter le boot.wim dans images de démarage
    ![alt text](pics/screen1.jpg)
    ![alt text](pics/screen2.jpg)
    ![alt text](pics/screen3.jpg)
    ![alt text](pics/screen4.jpg)
    ![alt text](pics/screen5.jpg)
    ![alt text](pics/screen6.jpg)

6. Ajouter le install.wim dans images d'installation<br>
    faire un group<br>
    ![alt text](pics/screen7.0.jpg)<br>
    Name:win<br>
    ![alt text](pics/screen7.1.jpg)<br>
    Ajouter l'image
    ![alt text](pics/screen8.JPG)
    ![alt text](pics/screen9.JPG)
    ![alt text](pics/screen10.JPG)
    ![alt text](pics/screen11.JPG)
    ![alt text](pics/screen12.JPG)
    ![alt text](pics/screen13.JPG)
    <br>

7. Deployment non automatisé
    ![alt text](pics/vm1.jpg)
    ![alt text](pics/vm2.jpg)
    ![alt text](pics/vm3.jpg)
    ![alt text](pics/vm4.jpg)
    **Finir le deployment manual**

## Partie 2

1. Deployment automatisé<br>
    *comment faire et modifer le ficher unattended.xml*

    ![alt text](pics/screen14.0.JPG)
    ![alt text](pics/screen14.1.JPG)
    ![alt text](pics/screen15.JPG)
    ![alt text](pics/screen16.jpg)
    ![alt text](pics/screen17.jpg)
    ![alt text](pics/screen18.jpg)
    ![alt text](pics/screen19.jpg)<br>
    Voci un example
    ![alt text](pics/screen20.jpg)<br>
    Puis sauvgaurdé

    Pour utilise le ficher durant le deployment<br>
    ![alt text](pics/screen21.jpg)
    ![alt text](pics/screen22.jpg)
    ![alt text](pics/screen23.jpg)
    ![alt text](pics/screen24.jpg)<br>
    *Maintenant il doit etre automatique vous pouvez prendre mon ficher xml pour voir l'example*
    
    ![alt text](pics/vm1.jpg)
    ![alt text](pics/vm2.jpg)
    ![alt text](pics/vm3.jpg)
    ![alt text](pics/vmauto0.jpg)
    ![alt text](pics/vmauto1.jpg)
    ![alt text](pics/vmauto2.jpg)
    ![alt text](pics/vmauto3.jpg)
    ![alt text](pics/vmauto4.jpg)
    ![alt text](pics/vmauto5.jpg)