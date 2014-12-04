dice-as-a-service
=================

Example Application for Developing Networked CLI Software with Ruby

This repository demonstrates one way to build networked software in Ruby. The initial commit is a trivial commandline script that rolls a number of multi-sided dice and outputs the sum. Over a few iterations, a few gems are introduced to improve readability and provide a better interface, growing into a service that offers the same dice-rolling functionality over the network, and a client to interface with that service.

Operating System Notes
----------------------

As this relies on [ffi-rzmq](https://github.com/chuckremes/ffi-rzmq), you will need to have the zeromq libraries available.

For OSX, [Homebrew](http://brew.sh/) is probably the easiest way to handle this:

```brew install zeromq```

For Ubuntu, [Chris Lea's PPA](https://launchpad.net/~chris-lea/+archive/ubuntu/zeromq) is a good choice:

```
sudo add-apt-repository ppa:chris-lea/zeromq
sudo aptitude install zeromq3
```

For Windows, you should really consult the [ØMQ documentation](http://zeromq.org/docs:windows-installations).
