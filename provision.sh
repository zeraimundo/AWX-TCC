echo
echo --------------------- Atualizando o Sistema ---------------------
echo

apt update
apt upgrade -y

echo
echo --------------------- Instalando dependencias ---------------------
echo

apt install curl git -y

echo
echo --------------------- Instalando e configurando o k3s ---------------------
echo

curl -sfL https://get.k3s.io | sh -
sudo chown vagrant:vagrant /etc/rancher/k3s/k3s.yaml

echo
echo --------------------- Instalando o Kustomize ---------------------
echo

sudo curl -s "https://raw.githubusercontent.com/kubernetes-sigs/kustomize/master/hack/install_kustomize.sh"  | bash

sudo mv kustomize /usr/local/bin

echo
echo --------------------- Criando os arquivos de kustomização ---------------------
echo

sudo cat <<EOT >> kustomization.yaml
---
apiVersion: kustomize.config.k8s.io/v1beta1

kind: Kustomization
resources:
  - github.com/ansible/awx-operator/config/default?ref=2.3.0
images:
  - name: quay.io/ansible/awx-operator
    newTag: 2.3.0
namespace: awx
---
EOT

echo
echo --------------------- Aplicando 1ª Kustomização ---------------------
echo

kustomize build . | kubectl apply -f -

sleep 60

sudo cat <<EOT >> awx.yaml
---
apiVersion: awx.ansible.com/v1beta1
kind: AWX
metadata:
  name: awx
spec:
  service_type: nodeport
  nodeport_port: 30080 
---
EOT

sudo cat <<EOT > kustomization.yaml
---
apiVersion: kustomize.config.k8s.io/v1beta1
kind: Kustomization
resources:
  - github.com/ansible/awx-operator/config/default?ref=2.3.0
  - awx.yaml
images:
  - name: quay.io/ansible/awx-operator
    newTag: 2.3.0
namespace: awx
---
EOT

echo
echo --------------------- Aplicando 2ª Kustomização ---------------------
echo

kustomize build . | kubectl apply -f -

echo
echo --------------------- Aguardar até o sistema subir ---------------------
echo
