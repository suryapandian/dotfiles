alias k=kubectl
complete -F __start_kubectl k # autocomplete k

# get yaml object instead of applying the changes
alias kg="kubectl --dry-run=client -o yaml get"
complete -F __start_kubectl kd

alias kr="kubectl replace -f"
alias kad="kubectl --dry-run=client apply -f"
alias ka="kubectl apply -f"

# delete resources immediately
alias kx="kubectl delete --grace-period=0 --force"
alias kde="kubectl describe"
alias kg="kubectl get"
alias kc="kubectl create"
alias kr="kubectl replace -f"
complete -F __start_kubectl kD

export d='--dry-run=client'
export o='-o yaml'
export do='--dry-run=client -o yaml'

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
