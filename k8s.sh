alias k=kubectl
#complete -F __start_kubectl k # autocomplete k

# get yaml object instead of applying the changes
alias kg="kubectl --dry-run=client -o yaml get"
#complete -F __start_kubectl kd

alias kr="kubectl replace -f"
alias kad="kubectl --dry-run=client apply -f"
alias ka="kubectl apply -f"

# delete resources immediately
alias kx="kubectl delete --grace-period=0 --force"
alias kde="kubectl describe"
alias kg="kubectl get"
alias kp='k get pods'
alias kpg='k get pods | rg'
alias cctxt='kubectl config view --minify'
#alias kc="kubectl create"
alias kr="kubectl replace -f"
#complete -F __start_kubectl kD

export d='--dry-run=client'
export o='-o yaml'
export do='--dry-run=client -o yaml'

#Copied from https://github.com/clux/dotfiles/blob/main/.k8s-helpers
kpfs() {
  local -r service="${1:-$(kubectl get service --no-headers | choose 0 | fzf)}"
  local -r spec="$(kubectl get service "${service}" -ojson | jq ".spec")"
  if [ "$(echo "${spec}" | jq ".ports[]" -Mc | wc -l)" -gt 1 ]; then
    portjson="$(echo "${spec}" | jq ".ports[]" -Mc | fzf --header='pick a port object')"
  else
    portjson="$(echo "${spec}" | jq ".ports[0]" -Mc)"
  fi
  local -r port="$(echo "${portjson}" | jq ".port" -r)"
  echo "Forwarding to svc/${service}:${port} via local 8000"
  kubectl port-forward "svc/${service}" "8000:${port}"
}

kns() {
  local -r ns="${1:-$(kubectl get ns --no-headers | choose 0 | fzf)}"
  local -r ctx="$(kubectl config current-context)"
  kubectl config set "contexts.${ctx}.namespace" "${ns}"
}

kc() {
  # Relies on KUBECONFIG set to colon delimeted list of all kubeconfigs ^
  # Exclude fqdn contexts (rancher-ism).
  kubectl config use-context "$(kubectl config get-contexts -o name | grep -v fqdn | fzf)"
}

kpfp() {
  local -r pod="${1:-$(kubectl get pod --no-headers | choose 0 | fzf)}"
  local -r data="$(kubectl get pod "${pod}" -ojson)"
  if [[ "$(jq '.spec.containers | length' <<< "${data}")" = 1 ]]; then
    local -r container="$(jq ".spec.containers[0].name" -r <<< "${data}")"
  else
    local -r container="$(jq ".spec.containers[].name" -r <<< "${data}" | fzf --header='mutliple containers; please pick one')" # user choice
  fi
  datajson="$(jq ".spec.containers[] | select(.name==\"${container}\")" <<< "${data}")"
  if [[ "$(jq ".ports" <<< "${datajson}")" == "null" ]]; then
    echo "No ports for $(tput bold)${container}$(tput sgr0) container in $(tput bold)${pod}$(tput sgr0)"
    return 1
  fi
  if [ "$(jq ".ports[]" -Mc <<< "${datajson}" | wc -l)" -gt 1 ]; then
    portjson="$(jq ".ports[]" -Mc <<< "${datajson}" | fzf --header="pick a port object")"
  else
    portjson="$(jq ".ports[0]" -Mc <<< "${datajson}")"
  fi
  port="$(jq ".containerPort" -r <<< "${portjson}")"
  echo "Forwarding to pod/${pod}:${port} via local 8000"
  kubectl port-forward "${pod}" "8000:${port}"
}
