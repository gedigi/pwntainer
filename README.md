# pwntainer
A Docker container for pwning

## List of tools
| Name | URL |
| --- | --- |
| pwntools | https://github.com/Gallopsled/pwntools |
| gef | https://github.com/hugsy/gef |
| radare2 | https://github.com/radare/radare2 |
| one_gadget | https://github.com/david942j/one_gadget |
| angr | https://github.com/angr/angr |
| frida | https://github.com/frida/frida |
| libcdb | https://github.com/niklasb/libc-database |

# Run - quick and dirty
```bash
$ docker run -ti gedigi/pwntainer bash
```

# Build + Run
Clone the repo, then run:
```bash
$ docker build -t pwntainer .
```

Then:
```bash
$ docker run -ti pwntainer bash
```
