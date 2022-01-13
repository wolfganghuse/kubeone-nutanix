# KubeOne Installer

NAME ?= template

export NUTANIX_PE_ENDPOINT=10.38.3.199
export NUTANIX_PE_USERNAME=admin
export NUTANIX_PE_PASSWORD=nx2Tech100!
export NUTANIX_ENDPOINT=hpoc.wooky.xyz
export NUTANIX_USERNAME=admin
export NUTANIX_PASSWORD=nx2Tech100!
export NUTANIX_PORT=9440
export NUTANIX_ALLOW_INSECURE=true

k1:
	terraform apply -state=state/${NAME}-state.tfstate -var 'cluster_name=${NAME}'
	terraform output -state=state/${NAME}-state.tfstate -json > state/${NAME}-tf.json
	./kubeone apply -m kubeone.yaml -t state/${NAME}-tf.json
clean:
	terraform destroy -state=state/${NAME}-state.tfstate -var 'cluster_name=${NAME}'
	rm state/${NAME}-*
