```shell
kubeseal --context kind-local-kind-cluster --format yaml \                             ─╯
--secret-file root-ca-tls-secret.ignore.yaml \
--namespace kube-system > root-ca-tls-secret.yaml
```