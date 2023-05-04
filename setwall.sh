setwall() {
    #script to set wallpaper(in darwin) in 1 command

    cd Desktop/script-downloads/
    FILEN=$RANDOM
    mv current.png $FILEN.png
    curl "$1" --output current.png
    osascript -e 'tell application "Finder" to set desktop picture to POSIX file "/Users/surge/Desktop/script-downloads/current.png"'
    osascript -e 'set the clipboard to (read (POSIX file "/Users/surge/Desktop/script-downloads/current.png") as JPEG picture)'
    echo "tried setting wallpaper"
    killall Dock
    cd
}
