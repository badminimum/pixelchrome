PIXELCHROME_LIB_URL="https://raw.githubusercontent.com/badminimum/pixelchrome/refs/heads/master/userstyles/pixelchrome.lib.less"
PIXELCHROME_FLAVOR_ENTRY="pixelchrome:Pixel Chrome*"

DEFAULT_FILE="$(realpath .)/catppuccin.user.less"
FILE="${1:-$DEFAULT_FILE}"

if [[ ! -f "$FILE" ]]; then
  echo "Error: file not found → $FILE" >&2
  echo "Usage: "
  echo "- Drag the file on this script"
  echo "- Provide the filepath as an argument"
  echo "- Name the file \"catppuccin.user.less\" and then run this script in the same directory."
  exit 1
fi

ORIGINAL_FILE="$(realpath "$FILE")"
STYLE_NAME=$(
  grep -m1 '^@name ' "$ORIGINAL_FILE" \
  | sed 's/^@name //' \
  | tr '[:upper:]' '[:lower:]' \
  | tr ' /' '--' \
  | tr -cd 'a-z0-9._-' \
  | sed 's/-catppuccin//g; s/catppuccin-//g; s/catppuccin//g'
)

# Copy file to tmp and rename
TEMP_FILE="/tmp/pixelchrome-catppuccin-userstyle-converter/$STYLE_NAME-pixelchrome.user.less"
mkdir -p /tmp/pixelchrome-catppuccin-userstyle-converter/
rm "$TEMP_FILE"
cp "$ORIGINAL_FILE" "$TEMP_FILE"

sed -i \
  -e "s|^@import \".*\";|@import \"$PIXELCHROME_LIB_URL\";|" \
  -e "/@var select lightFlavor/s/\*//g" \
  -e "/@var select darkFlavor/s/\*//g" \
  -e "/@var select accentColor/s/\*//g" \
  -e "/@var select accentColor/s/subtext0:Gray/subtext0:Gray*/" \
  -e "s|\(@var select lightFlavor \"Light Flavor\" \[.*\)\]|\1, \"$PIXELCHROME_FLAVOR_ENTRY\"]|" \
  -e "s|\(@var select darkFlavor \"Dark Flavor\" \[.*\)\]|\1, \"$PIXELCHROME_FLAVOR_ENTRY\"]|" \
  -e "s|^@name \(.*\) Catppuccin$|@name \1 Pixel Chrome (Catppuccin Extension)|" \
  -e "s|^@author Catppuccin$|@author Catppuccin, badminimum|" \
  -e "s|^@description \(.*\)$|@description \1, also with a Monochrome Theme (Pixel Chrome)|" \
  -e "/^@updateURL /d" \
  "$TEMP_FILE"

DEST_FILE="$(dirname "$FILE")/pixelchrome.user.less"
rm "$DEST_FILE"
cp "$TEMP_FILE" "$DEST_FILE"
