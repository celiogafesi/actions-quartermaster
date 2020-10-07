#!/bin/bash -ex
update_charts_dependencies() {
  local HELM_INITIALIZED=false
  local CHARTS_DIR=kubernetes/charts

  for chart_path in ${CHARTS_DIR}/*; do
    local HELM_BIN=helm

    if [[ $(cat "${chart_path}/Chart.yaml" | grep -E "apiVersion: .?v2") ]]; then
      HELM_BIN=helm3
    elif [[ $HELM_INITIALIZED = false ]]; then
      helm init --client-only
      HELM_INITIALIZED=true
    fi

    if [[ "${chart_path}/requirements.yaml" && ! -d "${chart_path}/charts" ]]; then
      ${HELM_BIN} dependencies update ${chart_path}
    else
      echo "No external dependencies found for ${chart_path}."
    fi
  done
}

update_charts_dependencies
