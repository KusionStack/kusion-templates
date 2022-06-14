# Kusion Templates

This repo contains the templates for `kusion init`, which make it easy to quickly get started building new Kusion projects.

## Adding a new template

 1. Create a new directory for the template, e.g. `my-template-single-stack`. By convention, hyphens are used to separate words and the stack mode is included as a suffix.

 2. Add template files in the new directory.

 3. Write a default configuration set file, aka, `kusion.yaml`.

## Text replacement

Kusion templates use [go template](https://pkg.go.dev/text/template) rules to generate output, which is described in `kusion.yaml`.

`kusion.yaml` contains all configurations, including project level and stack level. 

- `projectFields` represents project level configurations, which can be covered by stack ones.
- `stacks` represents stacks level configurations, which is specific to each stack.

Every field type should be one of these two kinds -- one is primitive, anthor is composite. For example:
- Primitive
  - string
  - int
  - float
  - bool
- Composite
  - array
  - map
  - struct
  - any

All variables defined in template shall have an explaination, for example:

Go template: 
```go
name: {{ .Name }}
age: {{ .Age }}
gender: {{- if .Sex }} Male {{- else}} Female {{ end }}
Hobbies: {{ range .Hobbies }}{{"\n"}}- {{.}}{{ end }}
Additional: {{ range $k, $v := .Additional }}{{"\n"}}  {{ $k }}: {{ $v }}{{ end }}
```

Field explainations:
```yaml
- name: Name
  type: string
  default: Tom
- name: Age
  type: int
  default: 8
- name: Sex
  type: bool
  default: true
- name: Hobbies
  type: array
  elem: 
    type: string 
  default: 
    - singing
    - dancing
- name: Additional
  type: map
  key:
    type: string
  value: 
    type: string
  default:
    Country: China
    Language: Simple Chinese
```

Output is similar to: 
```yaml
name: Tom
age: 8
gender: Male
Hobbies: 
- dancing
- singing
Additional: 
  Country: China
  Language: Simple Chinese
```