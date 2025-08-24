# Dev Container Features

This repository contains a collection of [Dev Container Features](https://containers.dev/features) that can be used in your dev containers.

## Available Features

| Feature | Description |
|---------|-------------|
| [hello-world](./src/hello-world) | A simple hello world feature that installs a greeting command |

## Usage

To use these features in your dev container, add them to your `devcontainer.json`:

```json
{
  "image": "mcr.microsoft.com/devcontainers/universal:2",
  "features": {
    "ghcr.io/yourusername/devcontainer-features/hello-world:1": {
      "greeting": "Hello",
      "name": "Developer"
    }
  }
}
```

## Publishing Features

This repository is set up to automatically publish features to GitHub Container Registry when you push changes to the main branch.

### Prerequisites

1. Enable GitHub Actions in your repository
2. Ensure the repository is public (or configure authentication for private repositories)
3. GitHub Actions will automatically build and publish your features

### Adding New Features

1. Create a new directory in `src/` with your feature name
2. Add the required files:
   - `devcontainer-feature.json` - Feature metadata
   - `install.sh` - Installation script
   - `README.md` - Feature documentation
3. Add tests in `test/your-feature-name/test.sh`
4. Update the main `devcontainer-features.json` file
5. Update this README with your new feature

### Feature Structure

Each feature should follow this structure:

```
src/
└── your-feature/
    ├── devcontainer-feature.json
    ├── install.sh
    └── README.md
test/
└── your-feature/
    └── test.sh
```

### Testing

You can test your features locally using the [Dev Container CLI](https://github.com/devcontainers/cli):

```bash
# Install the CLI
npm install -g @devcontainers/cli

# Test a feature
devcontainer features test --features hello-world .
```

## License

This project is licensed under the MIT License.