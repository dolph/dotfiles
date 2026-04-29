#!/bin/sh
# Print the vault password if available; otherwise emit a placeholder so
# ansible can initialize without erroring on a missing file. Encrypted
# vars only need to decrypt successfully when actually accessed at
# runtime.
if [ -f vault.pass ]; then
    cat vault.pass
else
    echo "no-vault"
fi
