#!/bin/bash

# Path to the web UI application
APP_PATH="$HOME/.local/bin/open-webui"

# Path to the desktop
DESKTOP_PATH="$HOME/Desktop"

# Path to the image in the project directory
ICON_PATH="$HOME/open_webui_package/open-webui-logo.png"

# Create the desktop shortcut
cat <<EOL > "$DESKTOP_PATH/OpenWebUI.desktop"
[Desktop Entry]
Name=Open WebUI
Exec=bash -c '$APP_PATH serve & sleep 5; xdg-open http://localhost:8080'
Icon=$ICON_PATH
Type=Application
Terminal=false
EOL

# Make the shortcut executable
chmod +x "$DESKTOP_PATH/OpenWebUI.desktop"

echo "Desktop shortcut created successfully."