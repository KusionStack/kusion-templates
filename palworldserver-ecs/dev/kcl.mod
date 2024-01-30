[package]
name = "{{ .ProjectName }}"
version = "0.1.0"

[dependencies]
catalog = { git = "https://github.com/liu-hm19/catalog.git", tag = "0.2.0" }

[profile]
entries = ["main.k", "${catalog:KCL_MOD}/models/terraform/render.k"]
