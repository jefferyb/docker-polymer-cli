# Supported tags

-	[`latest` (*Dockerfile*)](https://github.com/jefferyb/docker-polymer-cli/blob/master/Dockerfile)

# What is image for?
This is image contains a set of necessary tools for [Polymer CLI Development](https://www.polymer-project.org/1.0/start/toolbox/set-up),
so you can get up and running developing with Polymer without installing all the tools on your own computer.

Hopefully this will be a weekly image, with all the latest tools...

# How to use this image?

Go to your Polymer project folder, then execute:

```console
	$ docker run -d --name polymer-project -p 8080:8080 -v $(pwd):/home/polymer/app jefferyb/polymer-cli
```

Once it's up and running, just point your browser to port 8080...

If you want to connect as root (for example to install a package), then execute:

```console
	$ docker exec -it -u root polymer-project bash
```
