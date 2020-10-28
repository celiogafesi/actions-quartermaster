#!/bin/bash -ex
update_charts_dependencies() {
  local PROJECT_DIR=$1

  CHARTS_DIR=kubernetes/charts

  helm init --client-only
  for chart_path in ${CHARTS_DIR}/*; do
      HELM=helm
      if is_helm3 ${chart_path}; then
	  HELM=helm3
      fi
    if [[ "${chart_path}/requirements.yaml" && ! -d "${chart_path}/charts" ]]; then
      $HELM dependencies update ${chart_path}
    else
      echo "No external dependencies found for ${chart_path}."
    fi
  done
}

is_helm3() {
  local CHART_PATH=$1
  if [[ $(cat "${CHART_PATH}/Chart.yaml" | grep -E "apiVersion: .?v2") ]]; then
    return 0
  fi
  return 1
}

update_charts_dependencies "${PROJECT_DIR}"
