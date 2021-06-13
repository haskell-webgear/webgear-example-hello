# WebGear Example - Hello World
A simple hello world project to demonstrate usage of webgear-server library.

# How to run
Use stack to build and run the server:

```shell
stack build
stack exec hello
```

This will start the server localhost port 3000. Test it with:

```shell
curl http://localhost:3000/hello/Hulk
```
