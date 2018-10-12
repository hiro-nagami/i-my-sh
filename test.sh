#/bin/sh
echo "Load test.sh"

echo $(basename "$(test -L "$0" && readlink "$0" || echo "$0")")

if type pyenv > /dev/null 2>&1; then
  echo "Success"
else
  echo "Failure"
fi
