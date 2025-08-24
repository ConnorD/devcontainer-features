#!/bin/bash

set -e

VERSION=${VERSION:-"latest"}
INSTALL_PATH=${INSTALL_PATH:-"/usr/local/bin"}

echo "Installing Arduino CLI feature..."
echo "Version: ${VERSION}"
echo "Install path: ${INSTALL_PATH}"

# Detect architecture
ARCH=""
case "$(uname -m)" in
    x86_64) ARCH="64bit" ;;
    aarch64|arm64) ARCH="ARM64" ;;
    armv7l) ARCH="ARMv7" ;;
    *) echo "Unsupported architecture: $(uname -m)"; exit 1 ;;
esac

# Detect OS
OS=""
case "$(uname -s)" in
    Linux) OS="Linux" ;;
    Darwin) OS="macOS" ;;
    *) echo "Unsupported OS: $(uname -s)"; exit 1 ;;
esac

# Get the latest version if not specified
if [ "${VERSION}" = "latest" ]; then
    echo "Fetching latest Arduino CLI version..."
    VERSION=$(curl -s https://api.github.com/repos/arduino/arduino-cli/releases/latest | grep -o '"tag_name": "[^"]*' | grep -o '[^"]*$')
    echo "Latest version: ${VERSION}"
fi

# Remove 'v' prefix if present
VERSION=${VERSION#v}

# Construct download URL
DOWNLOAD_URL="https://github.com/arduino/arduino-cli/releases/download/v${VERSION}/arduino-cli_${VERSION}_${OS}_${ARCH}.tar.gz"

echo "Downloading Arduino CLI from: ${DOWNLOAD_URL}"

# Download and install
cd /tmp
curl -fsSL "${DOWNLOAD_URL}" -o arduino-cli.tar.gz

# Extract the binary
tar -xzf arduino-cli.tar.gz

# Move to install path
sudo mv arduino-cli "${INSTALL_PATH}/arduino-cli"

# Make executable
sudo chmod +x "${INSTALL_PATH}/arduino-cli"

# Clean up
rm -f arduino-cli.tar.gz

# Verify installation
echo "Verifying Arduino CLI installation..."
arduino-cli version

echo "Arduino CLI feature installed successfully!"
echo "You can now use: arduino-cli"
echo "To get started, run: arduino-cli config init"