import catalog.models.schema.v1 as ac

# main.k declares customized configurations for dev stack.
{{ .AppName }}: ac.AppConfiguration {
    workload.containers.{{ .AppName }}: {
        # dev stack has different app configuration
        image = {{ .Image }}
        resources = {
            "cpu": "250m"
            "memory": "256Mi"
        }
    }
    workload.replicas = 3
}