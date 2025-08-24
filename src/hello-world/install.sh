#!/bin/bash

set -e

GREETING=${GREETING:-"Hello"}
NAME=${NAME:-"World"}

echo "Installing hello-world feature..."
echo "Greeting: ${GREETING}"
echo "Name: ${NAME}"

# Create the hello command
cat > /usr/local/bin/hello << EOF
#!/bin/bash
echo "${GREETING}, ${NAME}!"
EOF

# Make it executable
chmod +x /usr/local/bin/hello

echo "hello-world feature installed successfully!"
echo "You can now run: hello"