# Usage
Edit HOST inside `payload.c`, compile with `make`. Start `nc` and run `pwn.sh` inside the container.

# Notes
- This exploit is destructive: it'll overwrite `/usr/bin/docker-runc` binary *on the host* with the
payload. It'll also overwrite `/bin/sh` inside the container.
- Tested only on Debian 9.
- No attempts were made to make it stable or reliable, it's only tested to work when a `docker exec
<id> /bin/sh` is issued on the host.

The original commit I used to write the exploit is [here](https://github.com/lxc/lxc/commit/6400238d08cdf1ca20d49bafb85f4e224348bf9d).

The researchers who actually found the vulnerability have published a writeup
[here](https://web.archive.org/web/20190213095645/https://blog.dragonsector.pl/2019/02/cve-2019-5736-escape-from-docker-and.html).

I've added the original exploit `CVE_2019_5736_tar_xz` which works differently than mine. Thanks to
[cyphar](https://github.com/cyphar) for pointing me to it.

