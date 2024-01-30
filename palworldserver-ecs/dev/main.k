import catalog.models.terraform.palworld

# main.k declares customized configurations for dev stack. 
{{ .AppName }} = palworld.PalWorldServer{
    name = "{{ .ResourceName }}"
    size = "{{ .Size }}"
    bandwidth = {{ .BandWidth }}
}
