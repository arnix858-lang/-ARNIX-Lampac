#!/bin/sh
set -eu

# Keep the .NET GC below Render's 512 MiB free-instance memory ceiling.
# 0x14000000 = 320 MiB managed-heap hard limit; remaining memory is reserved
# for native allocations, sockets, JIT and the operating system.
export DOTNET_GCHeapHardLimit=0x14000000
export DOTNET_GCConserveMemory=9
export DOTNET_gcServer=0
export DOTNET_EnableDiagnostics=0

PORT_VALUE="${PORT:-9118}"
sed "s/__PORT__/${PORT_VALUE}/g" /opt/arnix/init.template.conf > /lampac/init.conf

echo "ARNIX-Lampac starting on port ${PORT_VALUE} (conservative .NET memory mode)"
exec /usr/share/dotnet/dotnet /lampac/Core.dll
