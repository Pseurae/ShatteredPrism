#!/usr/bin/env bash

svg2png() {
    input_file="$1"
    output_file="$2"
    width="$3"
    height="$4"

    inkscape -w "$width" -h "$height" -o "$output_file" "$input_file"
}

if command -v "svgo"; then
    svgo org.lunaislazier.ShatteredPrism.Source.svg -o org.lunaislazier.ShatteredPrism.svg
else
    echo 'ERROR: svgo not in $PATH'
fi

if command -v "inkscape" && command -v "icotool"; then
    # Windows ICO
    d=$(mktemp -d)

    svg2png org.lunaislazier.ShatteredPrism.svg "$d/shatteredprism_16.png" 16 16
    svg2png org.lunaislazier.ShatteredPrism.svg "$d/shatteredprism_24.png" 24 24
    svg2png org.lunaislazier.ShatteredPrism.svg "$d/shatteredprism_32.png" 32 32
    svg2png org.lunaislazier.ShatteredPrism.svg "$d/shatteredprism_48.png" 48 48
    svg2png org.lunaislazier.ShatteredPrism.svg "$d/shatteredprism_64.png" 64 64
    svg2png org.lunaislazier.ShatteredPrism.svg "$d/shatteredprism_128.png" 128 128
    svg2png org.lunaislazier.ShatteredPrism.svg "$d/shatteredprism_256.png" 256 256

    rm shatteredprism.ico && icotool -o shatteredprism.ico -c \
        "$d/shatteredprism_256.png"  \
        "$d/shatteredprism_128.png"  \
        "$d/shatteredprism_64.png"   \
        "$d/shatteredprism_48.png"   \
        "$d/shatteredprism_32.png"   \
        "$d/shatteredprism_24.png"   \
        "$d/shatteredprism_16.png"
else
    echo "ERROR: Windows icons were NOT generated!" >&2
    echo "ERROR: requires inkscape and icotool in PATH"
fi

if command -v "inkscape" && command -v "magick"; then
    # macOS ICNS
    d=$(mktemp -d)

    d="$d/shatteredprism.iconset"

    mkdir -p "$d"

    svg2png org.lunaislazier.ShatteredPrism.bigsur.svg "$d/icon_512x512@2.png" 1024 1024
    magick convert "$d/icon_512x512@2.png" -resize 16x16 "$d/icon_16x16.png"
    magick convert "$d/icon_512x512@2.png" -resize 32x32 "$d/icon_16x16@2.png"
    magick convert "$d/icon_512x512@2.png" -resize 32x32 "$d/icon_32x32.png"
    magick convert "$d/icon_512x512@2.png" -resize 64x64 "$d/icon_32x32@2.png"
    magick convert "$d/icon_512x512@2.png" -resize 128x128 "$d/icon_128x128.png"
    magick convert "$d/icon_512x512@2.png" -resize 256x256 "$d/icon_128x128@2.png"
    magick convert "$d/icon_512x512@2.png" -resize 256x256 "$d/icon_256x256.png"
    magick convert "$d/icon_512x512@2.png" -resize 512x512 "$d/icon_256x256@2.png"
    magick convert "$d"/* shatteredprism.icns
else
    echo 'ERROR: macOS icons were NOT generated!' >&2
    echo 'ERROR: requires inkscape and magick in $PATH'
fi

# replace icon in themes
cp -v org.lunaislazier.Shatteredprism.svg "../launcher/resources/multimc/scalable/launcher.svg"
