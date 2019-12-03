# Development
To develop PotatOS, clone this repo with

```
git clone git@gitlab.com:potatos-project/potatos.git --recurse-submodules
```

To update submodules or to get them if you already cloned

```
git submodule update --init --recurse
```

All development work should be done inside Docker. You can build the container you need to develop with

```
make build-container
```

This will take a bit and create the image on your machine. Once this is done, you can get a shell into it with

```
make stack
```

You won't need to run `make build-container` again until the `Dockerfile` is updated, which should be rare.

# Building

In general, PotatOS's kernel should be built by:

```
# start the docker container and enter the shell
# should be run inside the root directory of the metarepo
make stack

# once inside the docker shell
# make a new directory in `kernel`
mkdir -p kernel/build

# use a subshell to do the build
(cd kernel/build && cmake .. && make)
```

You'll find `kernel.img` in `kernel/build`.

You can run using `./run_qemu <disk image name>` but there is no user mode image yet.

# Source Control

The structure of this repository is a little unusual in a way most of you probably haven't seen. It makes use of Git submodules. Essentially, there's one big repository (`PotatOS`) which has as its submodules the various other repos, like `kernel` and `bfg9k`. The submodules are stored in `PotatOS` as references to certain revisions of the other repositories. So, when developing a new feature, you should probably only create branches for it in repos you're actually going to change and keep track of which repos you need to check out different branches on. When you eventually merge to `master`, you'll merge your various branches into their individual repos, and then update the revisions in `PotatOS`. 