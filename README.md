Для запуска необходимо положить файл .gce-account.json в корень репозитория. @todo сделать example для файлов в .gitignore

cri-o надо вручную указать версию cni в файле /etc/cni/... flannel этого не делает (сейчас поддерживается 0.3.0)

root@k8s-worker-cri-o:/etc/crio# cat /etc/cni/net.d/10-flannel.conflist 
{
  "cniVersion": "0.3.0",
  ...
}