#!/bin/sh

# Query macOS settings
accent=$(defaults read -g AppleAccentColor 2>/dev/null || echo "nil")
appearance=$(defaults read -g AppleInterfaceStyle 2>/dev/null || echo "Light")

export WHITE=0xffffffff

# Convert RGB to hex with alpha
to_hex() {
  printf "0x%02x%02x%02x%02x" "$1" "$2" "$3" "$4"
}

# Get base color RGB value
case "$accent" in
  "nil") r=40; g=133; b=251 ;;  # Blue
  "-1") r=92; g=92; b=92 ;;     # Graphite
  "0") r=211; g=47; b=47 ;;     # Red
  "1") r=245; g=124; b=0 ;;     # Orange
  "2") r=251; g=192; b=45 ;;    # Yellow
  "3") r=76; g=175; b=80 ;;     # Green
  "5") r=126; g=87; b=194 ;;    # Purple
  "6") r=236; g=64; b=122 ;;    # Pink
  *) r=40; g=133; b=251 ;;      # Default Blue
esac

# Set colors based on appearance
if [ "$appearance" = "Dark" ]; then
  export LABEL_COLOR=$(to_hex 204 $r $g $b)
  export ITEM_BG_COLOR=$(to_hex 255 $((r/10)) $((g/10)) $((b/10)))
else
  export LABEL_COLOR=$(to_hex 204 $r $g $b)
  export ITEM_BG_COLOR=$(to_hex 200 $((r*7/10)) $((g*7/10)) $((b*7/10)))
fi

export ACCENT_COLOR=$(to_hex 255 $r $g $b)