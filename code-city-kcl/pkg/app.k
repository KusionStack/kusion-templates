schema App:
    image: str
    name: str = "{{ .AppName }}"
    namespace: str = "default"
    replicas: int = 1
    labels: {str:str} = {
        "app.kubernetes.io/name" = name
        "app.kubernetes.io/env" = "dev"
    }
    containerPort: int = {{ .ContainerPort }}
    servicePort: int = {{ .ServicePort }}

    deployment: {str:} = {
        apiVersion = "apps/v1"
        kind = "Deployment"
        metadata.name = name
        matadata.namespace = namespace
        spec.replicas = replicas
        spec.selector.matchLabels = labels
        spec.template = {
            metadata.labels = labels
            spec.containers = [
                {
                    name = "{}-backend".format(name)
                    image = image
                    imagePullPolicy = "IfNotPresent"
                    ports = [{
                        containerPort = containerPort
                        protocol = "TCP"
                    }]
                }
            ]
        }
        __settings__ = {output_type = "STANDALONE"}
    }
    service: {str:} = {
        apiVersion = "v1"
        kind = "Service"
        metadata.name = name
        matadata.namespace = namespace
        spec.ports = [{
            name = "{}-backend".format(name)
            targetPort = containerPort
            port = servicePort
        }]
        spec.selector = labels
        __settings__ = {output_type = "STANDALONE"}
    }

    __settings__ = {output_type = "IGNORE"}
