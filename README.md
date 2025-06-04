<div align="center">

#### _Read this in [other languages](translations/Translations.md)._
<kbd>[<img title="English" alt="English" src="https://cdn.jsdelivr.net/gh/hjnilsson/country-flags@master/svg/us.svg" width="44">](README.md)</kbd>
<kbd>[<img title="Português" alt="Português" src="https://cdn.jsdelivr.net/gh/hjnilsson/country-flags@master/svg/pt.svg" width="44">](lang/README-PT.md)</kbd>
<kbd>[<img title="Español" alt="Español" src="https://cdn.jsdelivr.net/gh/hjnilsson/country-flags@master/svg/es.svg" width="44">](lang/README-ES.md)</kbd>
<kbd>[<img title="Français" alt="Français" src="https://cdn.jsdelivr.net/gh/hjnilsson/country-flags@master/svg/fr.svg" width="44">](lang/README-FR.md)</kbd>
<kbd>[<img title="Italiano" alt="Italiano" src="https://cdn.jsdelivr.net/gh/hjnilsson/country-flags@master/svg/it.svg" width="44">](lang/README-IT.md)</kbd>

</div>

<div align="center">

<div align="center">
  
![GitHub commit activity](https://img.shields.io/github/commit-activity/t/philipmello/kubernetes-from-scratch?style=for-the-badge&logo=github&logoSize=auto&labelColor=%238000ff&color=%23bf00ff)
![GitHub followers](https://img.shields.io/github/followers/philipmello?style=for-the-badge&labelColor=%2300bfff&color=%23bf00ff)
![GitHub forks](https://img.shields.io/github/forks/philipmello/kubernetes-from-scratch?style=for-the-badge&labelColor=%2300bfff&color=%23bf00ff)
![GitHub Repo stars](https://img.shields.io/github/stars/philipmello/kubernetes-from-scratch?style=for-the-badge&labelColor=%23bf00ff)
![GitHub watchers](https://img.shields.io/github/watchers/philipmello/kubernetes-from-scratch?style=for-the-badge&labelColor=%23bf00ff)
  
</div>

<div align="center">
<h1>💡 K8s From Scratch</h1>

| ![DigitalOcean](https://img.icons8.com/?size=100&id=cvzmaEA4kC0o&format=png&color=000000) |
| ------------------------------------------------------------ |
| [Digital Ocean](/digital-ocean)                     |


  <img src="https://capsule-render.vercel.app/api?type=waving&color=gradient&height=80&section=footer"/>
</div>

---

# Digital Ocean

---
<a href="https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/create-cluster-kubeadm/"><img src="https://kubernetes.io/images/kubeadm-stacked-color.png" width="150" height="160"></a>
# ☸ Kubernetes: Architecture and Essential Components

#### A Kubernetes Cluster is defined as a `set of machines`, whether physical or virtual, that run Kubernetes to host and manage containers. This cluster is fundamentally divided into two main components: the Master Node `(Control Plane)` and the `Worker Nodes`.

#### The Master Node is described as the component that manages the cluster and acts as the "brain" of Kubernetes. It is responsible for making crucial decisions, such as scheduling containers and maintaining the desired state of the system.

---
#### The following main components that make up the Master Node:
- API Server (kube-apiserver): Este é o ponto de entrada para todos os comandos e interações com o cluster. Ele facilita a comunicação entre os componentes do Control Plane e também com os Worker Nodes.

- Scheduler: A função do scheduler é decidir em qual worker node um pod (que é a menor unidade de execução no Kubernetes e pode conter um ou mais contêineres) deve ser executado. Ele leva em consideração fatores como recursos disponíveis e afinidade ao tomar essa decisão.

- Controller Manager: Este componente monitora o estado do cluster. Ele realiza ações para garantir que o estado desejado seja atingido. Um exemplo citado é garantir que o número correto de réplicas de um pod esteja em execução.

- etcd: Descrito como um banco de dados distribuído, o etcd é onde o estado do cluster e as configurações do Kubernetes são armazenados. Ele mantém informações sobre todos os objetos dentro do cluster, como pods, deployments (que definem como pods são gerenciados e atualizados), services (que expõem conjuntos de pods), entre outros.

---
#### In short, the Master Node (Control Plane) is essential for the functioning of the Kubernetes Cluster, orchestrating operations and ensuring that the state of the cluster matches the desired state. While the Worker Nodes are the machines that execute the containerized applications, the Master Node is the one that makes the decisions and manages this execution, communicating with the agents (kubelets) on the Worker Nodes and maintaining the centralized record of the cluster state in etcd. This split architecture allows Kubernetes to automate application management, including creation, distribution, scaling, and monitoring.
