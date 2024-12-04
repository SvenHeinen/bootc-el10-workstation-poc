# What
This repo builds a CentOS Stream 10 Workstation using bootc with some sample content and hardening rules.

# Why?
To demonstrate this is a feasible way to manage Linux workstations, especially in a enterprise context.

# Should I use this in production?
NO!

# Requirements:
Linux system with podman installed and root access. The resulting image is a qcow2 disk image. Make sure you have sufficient disk space since resulting container image is around 8 GB.

# How to build?
`sudo ./build.sh` 

