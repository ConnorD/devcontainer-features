# Dev Container Features

This repository contains a collection of [Dev Container Features](https://containers.dev/features) that can be used in your dev containers.

## Available Features

| Feature | Description |
|---------|-------------|
| [arduino-cli](./src/arduino-cli) | Installs the Arduino CLI for managing Arduino boards, libraries, and sketches |

## Usage

To use these features in your dev container, add them to your `devcontainer.json`:

```json
{
  "image": "mcr.microsoft.com/devcontainers/universal:2",
  "features": {
    "ghcr.io/connordenman/devcontainer-features/arduino-cli:1": {
      "version": "latest",
      "installPath": "/usr/local/bin"
    }
  }
}
```

### Arduino CLI Feature

The `arduino-cli` feature installs the [Arduino CLI](https://arduino.github.io/arduino-cli/) tool, which allows you to manage Arduino boards, libraries, and sketches from the command line.

#### Options

| Option | Type | Default | Description |
|--------|------|---------|-------------|
| `version` | string | `"latest"` | Version of Arduino CLI to install. Use `"latest"` for the most recent release, or specify a version |
| `installPath` | string | `"/usr/local/bin"` | Installation path for the Arduino CLI binary |

#### Example Usage

```json
{
  "features": {
    "ghcr.io/connordenman/devcontainer-features/arduino-cli:1": {}
  }
}
```

After installation, you can use Arduino CLI commands like:
- `arduino-cli config init` - Initialize configuration
- `arduino-cli board list` - List connected boards
- `arduino-cli lib search` - Search for libraries
- `arduino-cli compile` - Compile sketches
- `arduino-cli upload` - Upload sketches to boards

#### USB Device Access

To connect and upload to Arduino boards via USB, you need to mount the USB devices into your devcontainer. This must be configured in your `.devcontainer/devcontainer.json` file (not in the feature itself).

Add the appropriate USB device to your `devcontainer.json`:

```json
{
  "features": {
    "ghcr.io/connordenman/devcontainer-features/arduino-cli:1": {}
  },
  "runArgs": [
    "--device=/dev/ttyUSB0:/dev/ttyUSB0"
  ]
}
```

For macOS, Arduino boards typically appear as `/dev/tty.usbmodem*` or `/dev/tty.usbserial*`. For Linux, they appear as `/dev/ttyUSB*` or `/dev/ttyACM*`.

Alternatively, for full USB access (less secure):

```json
{
  "runArgs": ["--privileged"],
  "mounts": [
    "source=/dev,target=/dev,type=bind"
  ]
}
```

**Note**: USB device mounting requires host-level permissions and must be configured by the devcontainer consumer, not by the feature itself.

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
devcontainer features test --features arduino-cli .
```

## License

This project is licensed under the MIT License.
