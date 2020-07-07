#!/usr/bin/env python3
import subprocess as subp
import shlex
import pathlib
import os

try:
    docker_user = os.environ["DOCKER_ID_USER"]
except KeyError:
    raise SystemExit("Error: You need to set DOCKER_ID_USER")


def cmd(cmd, **kwargs):
    cmd = cmd.format(**globals())
    print(cmd)
    subp.check_call(shlex.split(cmd), **kwargs)


images = []
for dockerfile in pathlib.Path().glob("*.Dockerfile"):
    cwd = pathlib.Path().absolute()
    stem = dockerfile.stem
    image = f"{docker_user}/{stem}_nlopt"
    cmd("docker build -f {dockerfile} -t {image} .")
    images.append(image)

cmd("docker login -u {docker_user}")
for image in images:
    cmd("docker push {image}")
