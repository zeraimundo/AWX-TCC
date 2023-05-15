<div align="right">
  <img src="https://www.ifpb.edu.br/en/imagens/logotipos/ifpb.png" alt="Ícone IFPB" width="70">
</div>

# Provisionamento de serviços em nuvem com AWX
<br>
<div align="center">
<a href="https://github.com/ansible/awx"><img alt="AWX" src="https://img.shields.io/badge/AWX-%23EE0000.svg?logo=Ansible-Tower&logoColor=white">
<a href="https://aws.amazon.com/pt/"><img alt="AWS" src="https://img.shields.io/badge/AWS-%23FF9900.svg?logo=amazon-aws&logoColor=white">
<a href="https://www.vagrantup.com/downloads"><img alt="Vagrant" src="https://img.shields.io/badge/Vagrant-%231563FF.svg?logo=vagrant&logoColor=white"> <a href="https://www.virtualbox.org/wiki/Downloads"><img alt="VirtualBox" src="https://img.shields.io/badge/VirtualBox-%23323330.svg?logo=virtualbox&logoColor=white"> <a href="https://kubernetes.io/pt-br/"><img alt="Kubernetes" src="https://img.shields.io/badge/Kubernetes-%23326CE5.svg?logo=kubernetes&logoColor=white">
</div>
<br>
<p style="text-align:justify">Este repositório é um apêndice do Projeto de Implementação "Provisionamento de serviços em nuvem com AWX", trabalho de conclusão do Curso Superior de Tecnologia em Redes de Computadores do Instituto Federal da Paraíba e contém os arquivos Vagrantfile e provision.sh que serão necessários para instanciar uma máquina virtual e implantar o sistema AWX.</p><br>

<b>Requisitos*:</b>

Para fazer o deploy do sistema o usuário deverá ter em sua máquina o Vagrant instalado.

<b>Requisitos mínimos para máquina virtual:</b> 2 CPU's e 4 GB de memória Ram<br>
<b>Requisitos recomendados para máquina virtual:</b> 4 CPU's e 8 GB de memória Ram

<b>Instalação:</b>

<b>Instalar vagrant e git</b><br>
```bash
sudo apt update
sudo apt install vagrant git -y
```

<b>Fazer o deploy do sistema</b><br>
Para instalar basta clonar o repositório, acessar o diretório AWX-TCC e executar o comando  e usar o <b>vagrant up</b><br>

```bash
git clone https://github.com/zeraimundo/AWX-TCC
cd AWX-TCC
vagrant up
```

O processo poderá demorar um pouco pois será criada uma máquina virtual e instalado o sistema.<br>Para checar a conclusão poderá ser usado o comando: 

```bash
kubectl get pods --namespace awx
```
A imagem abaixo apresenta o resultado do comando após a conclusão da instalação.

![image](https://user-images.githubusercontent.com/82219488/234564735-22cde0d4-c78e-4dd5-bf96-9b64268473b6.png)

Para acessar o sistema após a conclusão da instalação utilizaremos um navegador web. O endereço a ser acessado é o ip do servidor seguido por :30080 (porta definida nos scripts de instalação)

Caso não saiba o ip do servidor AWX, na pasta AWX-TCC abra um terminal e digite <b>vagrant ssh</b> para acessar o servidor, depois digite <b>ip a</b> para verificar as conexões de rede.<p>Identifique dentre as conexões àquela que pertença a sua rede local e esse será o ip do servidor.

![image](https://user-images.githubusercontent.com/82219488/234567766-9ea6fef4-7828-4856-ba38-ab9b317b2064.png)

Tela de login no servidor AWX

![image](https://user-images.githubusercontent.com/82219488/234565959-127a7d8f-bac2-488d-8d23-77f79d942fda.png)

  Para acessar o sistema pela primeira vez utilize o usuário <b>admin</b><br>A senha de acesso é criada automaticamente na instalação, para descobrir utilize o comando:
  
  ```bash
  kubectl get secret awx-admin-password -o jsonpath="{.data.password}" --namespace awx | base64 --decode
  ```
  
  ![image](https://user-images.githubusercontent.com/82219488/234569462-af8bb59a-9d4a-4556-b140-27e6a29e3752.png)

A senha será exibida na próxima linha, ela é apresentada junto com a entrada do shell, nesse caso ela foi: wDfsyvqXpRxxZzQzb8SwEExUfWbOmyxv
  
  Após acessar o sistema pela primeira vez a mesma pode ser alterada.
  

*O AWX na sua versão atual não possui em seu repositório informações sobre requisitos, para este projeto tomaremos como base os requisitos do Ansible Automation Platform
