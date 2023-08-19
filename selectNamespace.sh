#!/bin/bash
echo 'Select context'
kubectx
a=$(kubectx -c)
export KUBECTX=$a
a=${a//aks-/}
a=${a//01-*/}
namespace=$(cat ~/.kube/namespaces | gum filter)
namespace=$(echo ${a}-${namespace})
export KUBENS=$namespace

