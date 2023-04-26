# AWX-TCC

Neste repositório encontam-se os arquivos Vagrantfile e provision.sh que serão necessários para instanciar uma máquina virtual e subir o sistema AWX.

<b>Requisitos:</b>

Para fazer o deploy do sistema o usuário deverá ter em sua máquina o Vagrant instalado.

<b>Requisitos mínimos para máquina virtual:</b> 2 CPU's e 4 GB de memória Ram<br>
<b>Requisitos recomendados para máquina virtual:</b> 4 CPU's e 8 GB de memória Ram

<b>Instalação:</b>

<b>Instalar vagrant e git</b><br>
$ sudo apt install vagrant git -y

<b>Fazer o deploy do sistema</b><br>
Para instalar basta clonar o repositório, acessar o diretório AWX-TCC e executar o comando  e usar o <b>vagrant up</b><br>

$ git clone https://github.com/zeraimundo/AWX-TCC<br>
$ cd AWX-TCC<br>
$ vagrant up<br>

O processo poderá demorar um pouco pois será criada uma máquina virtual e instalado o sistema.<br>Para checar a conclusão poderá ser usado o comando: <p><b>kubectl get pods --namespace awx</b><br>A imagem abaixo apresenta o resultado do comando após a conclusão da instalação.

![image](https://user-images.githubusercontent.com/82219488/234564735-22cde0d4-c78e-4dd5-bf96-9b64268473b6.png)

Para acessar o sistema após a conclusão da instalação utilizaremos um navegador web. O endereço a ser acessado é o ip do servidor seguido por :30080 (porta definida nos scripts de instalação)

Caso não saiba o ip do servidor AWX, na pasta AWX-TCC digite <b>vagrant ssh</b> para acessar o servidor, depois digite <b>ip a</b> para verificar as conexões de rede.<p>Identifique dentre as conexões àquela que pertença a sua rede local e esse será o ip do servidor.

![image](https://user-images.githubusercontent.com/82219488/234567766-9ea6fef4-7828-4856-ba38-ab9b317b2064.png)

Tela de login no servidor AWX

![image](https://user-images.githubusercontent.com/82219488/234565959-127a7d8f-bac2-488d-8d23-77f79d942fda.png)
