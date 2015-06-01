[azukiapp/debian](http://images.azk.io/#/debian)
==================

Base docker image to run **Linux** applications in [`azk`](http://azk.io)

Versions (tags)
---

<versions>
- [`latest`, `jessie`, `8`, `8.0`](https://github.com/azukiapp/docker-debian/blob/master/8.0/Dockerfile)
</versions>

Image content:
---

- Debian 8.0 Jessie
- Git
- VIM
- curl
- wget
- python
- Fixed en_US.UTF-8 locales

### Usage with `azk`

Example of using that image with [azk](http://azk.io):

```js
/**
 * Documentation: http://docs.azk.io/Azkfile.js
 */
 
// Adds the systems that shape your system
systems({
  "my-app": {
    // Dependent systems
    depends: [], // postgres, mysql, mongodb ...
    // More images:  http://images.azk.io
    image: {"docker": "azukiapp/debian"},
    // Steps to execute before running instances
    provision: [
      // "./script.sh",
    ],
    workdir: "/azk/#{manifest.dir}",
    shell: "/bin/bash",
    command: "# command to run app. i.g.: `./start.sh`",
    wait: {"retry": 20, "timeout": 1000},
    mounts: {
      '/azk/#{manifest.dir}': path("."),
    },
    scalable: {"default": 2},
    http: {
      domains: [ "#{system.name}.#{azk.default_domain}" ]
    },
    ports: {
      // http: "8080"
    },
    envs: {
      // set instances variables
      EXAMPLE: "value",
    },
  },
});
```

### Usage with `docker`

To create the image `azukiapp/debian`, execute the following command on the docker-debian folder:

```sh
$ docker build -t azukiapp/debian .
```

To run the image and bind to port 8080:

```sh
$ docker run -it --rm --name my-app -p 8080:8080 -v "$PWD":/myapp -w /myapp azukiapp/debian script.sh
```

Logs
---

```sh
# with azk
$ azk logs my-app

# with docker
$ docker logs <CONTAINER_ID>
```

## License

Azuki Dockerfiles distributed under the [Apache License](https://github.com/azukiapp/dockerfiles/blob/master/LICENSE).
