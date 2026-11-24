#!/bin/sh
set -eu

PORT_VALUE="${PORT:-9118}"
sed "s/__PORT__/${PORT_VALUE}/g" /opt/arnix/init.template.conf > /lampac/init.conf

echo "ARNIX-Lampac starting on port ${PORT_VALUE}"
exec /usr/share/dotnet/dotnet /lampac/Core.dll
