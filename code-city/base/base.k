import base.pkg.kusion_models.kube.frontend
import base.pkg.kusion_models.kube.frontend.service
import base.pkg.kusion_models.kube.frontend.container

# Application Configuration
appConfiguration: frontend.Server {
    # Main Container Configuration
    mainContainer = container.Main {
        name = "{{ .AppName }}"
        ports = [
            { containerPort = {{ .ContainerPort }} }
        ]
    }

    useBuiltInSelector = False
    selector: {
        "app.kubernetes.io/name" = "{{ .AppName }}"
        "app.kubernetes.io/env" = "dev"
    }

    useBuiltInLabels = False
    podMetadata.labels: {
        "app.kubernetes.io/name" = "{{ .AppName }}"
        "app.kubernetes.io/env" = "dev"
    }

    services = [
        service.Service {
            name = "{{ .AppName }}"
            type = "ClusterIP"
            ports = [
                {
                    name = "{}-backend".format("{{ .AppName }}")
                    port = {{ .ServicePort }}
                    targetPort = {{ .ContainerPort }}
                    protocol = "TCP"
                }
            ]
        }
    ]
}