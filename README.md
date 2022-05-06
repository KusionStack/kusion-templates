# Kusion Templates

This repo contains the templates for `kusion init`, which make it easy to quickly get started building new Kusion projects.

## Adding a new template

 1. Create a new directory for the template, e.g. `my-template-single-stack`. By convention, hyphens are used to separate words and the stack mode is included as a suffix.

 2. Add template files in the new directory.

## Text replacement

Kusion templates use [go template](https://pkg.go.dev/text/template) rules to generate output, which is described in `kusion.yaml`.

`kusion.yaml` contains all configurations, including project level and stack level. 

- `common` represents project level configurations, which can be covered by stack ones.
- `stacks` represents stacks level configurations, which is specific to each stack.