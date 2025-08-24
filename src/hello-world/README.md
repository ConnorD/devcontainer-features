# Hello World (hello-world)

A simple hello world feature that installs a greeting command.

## Example Usage

```json
"features": {
    "ghcr.io/yourusername/devcontainer-features/hello-world:1": {}
}
```

## Options

| Options Id | Description | Type | Default Value |
|-----|-----|-----|-----|
| greeting | The greeting to use | string | Hello |
| name | The name to greet | string | World |

## Example with custom options

```json
"features": {
    "ghcr.io/yourusername/devcontainer-features/hello-world:1": {
        "greeting": "Hi",
        "name": "Developer"
    }
}
```

This will create a `hello` command that outputs "Hi, Developer!" when executed.