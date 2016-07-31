# Supported tags

-	[`latest` (*Dockerfile*)](https://github.com/jefferyb/docker-polymer-cli/blob/master/Dockerfile)

# What is image for?
This is image contains a set of necessary tools for [Polymer CLI Development](https://www.polymer-project.org/1.0/start/toolbox/set-up),
so you can get up and running developing with Polymer without installing all the tools on your own computer.

This image is built weekly, with all the latest tools...

## Build an app with App Toolbox

Using the [Polymer Project Documentation](https://www.polymer-project.org/1.0/start/toolbox/set-up):

	Initialize & serve your project from a template
	===============================================

	1. Create a new project folder to start from

		$ mkdir my-app
		$ cd my-app

	2. Initialize your project with an app template

		$ docker run --rm -v $(pwd):/home/polymer/app jefferyb/polymer-cli polymer init app-drawer-template

	3. Serve your project

		$ docker run --name polymer-project -d -p 8080:8080 -v $(pwd):/home/polymer/app jefferyb/polymer-cli polymer serve -H 0.0.0.0

		and just point your browser to port 8080

	4. When you're done serving your project

		$ docker rm -f polymer-project

# How to use this image?

Go to your Polymer project folder, then execute:

```console
docker run --name polymer-project -d -p 8080:8080 -v $(pwd):/home/polymer/app jefferyb/polymer-cli polymer serve -H 0.0.0.0
```

Once it's up and running, just point your browser to port 8080...

## Quick Tip

Since the `docker run` command is long, and if you're going to be using it often, I would suggest creating/adding an alias for it in your .bash_profile or .bashrc, like:

```console
alias polymer="docker run --name polymer-project --rm -p 8080:8080 -v $(pwd):/home/polymer/app jefferyb/polymer-cli polymer "
```

and then you can just use `polymer` along with the [Polymer CLI commands](https://github.com/Polymer/polymer-cli), like:

```console
polymer init app-drawer-template
```
to initialize a Polymer project from the app-drawer-template or one of other several templates, or

```console
polymer serve -H 0.0.0.0
```
to run a development server that you can reach at port 8080

## Polymer-CLI Commands

[Polymer-CLI](https://github.com/Polymer/polymer-cli) includes a number of tools for working with Polymer and Web Components:

  * __init__ - Initializes a Polymer project from one of several templates
  * __build__	- Builds an application-style project
  * __lint__ - Lints the project
  * __serve__	- Runs a development server
  * __test__ - Runs tests with web-component-tester

## Tools included in this image:

This image includes:

	* LTS version (4.x) of Node.js
	* git
	* Bower
	* Polymer CLI

And you can make alias for them too to work with your project with something like:
```console
alias bower2docker="docker run --rm -v $(pwd):/home/polymer/app jefferyb/polymer-cli bower "
```
and then you can use `bower2docker install` or `bower2docker update`, and/or
```console
alias npm2docker="docker run --rm -v $(pwd):/home/polymer/app jefferyb/polymer-cli npm "
```
and then use `npm2docker install` or `npm2docker update`

## Container Shell Access

The `docker exec` command allows you to run commands inside a Docker container. The following command line will give you a bash shell inside your Polymer project container:

```console
docker exec -it polymer-project bash
```

If you want to connect as root (for example to install a package), then execute:

```console
docker exec -it -u root polymer-project bash
```
