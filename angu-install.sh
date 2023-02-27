#!/usr/bin/env bash

DEST_DIR="$HOME/programs/angu"

C_DIR=$(dirname "$(realpath "$0")")
dist_file=$(find "${C_DIR}/target" -type f -name '*dist.zip' 2>/dev/null)


if [ ! -f "$dist_file" ]; then
  echo "Building package..."
  mvn -f "$C_DIR/pom.xml" -q clean package -DskipTests
  dist_file=$(find "${C_DIR}/target" -type f -name '*dist.zip')
  if [ ! -f "$dist_file" ]; then
    echo "No distribution file was found to install" && exit 1
  fi
fi

mkdir -p "$DEST_DIR"
unzip -o -qq "$dist_file" -d "$DEST_DIR"
PROJ_NAME=$(zipinfo -1 "$dist_file" | head -1 | cut -d'/' -f1)
PROJ_REL_PATH_START_SCRIPT=$(zipinfo -1 "$dist_file" | grep bin | grep sh | head -1)
echo "Package $PROJ_NAME installed at: $DEST_DIR"

cat << EOF > "$HOME"/bin/"$PROJ_NAME"
#!/usr/bin/env bash
${DEST_DIR}/$PROJ_REL_PATH_START_SCRIPT \${1+"\$@"}
EOF

chmod 744  "$HOME/bin/$PROJ_NAME"
cat "$HOME/bin/$PROJ_NAME"

