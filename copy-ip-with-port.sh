#!/bin/bash
# script that copies current ip and binds to clipboard, which makes viewing the same localhost on my iPhone easy
function copy_url() {
  set +e
  while getopts ":p:" opt; do
    case $opt in
      p)
        IP=$(ifconfig en0 | grep 'inet ' | awk '{print $2}')
        echo "http://$IP:$OPTARG" | pbcopy
        echo "Copied URL to clipboard: http://$IP:$OPTARG"
        ;;
      \?)
        echo "Invalid option: -$OPTARG" >&2
        ;;
      :)
        echo "Option -$OPTARG requires an argument." >&2
        ;;
    esac
  done
}

# Call the function
copy_url "$@"
