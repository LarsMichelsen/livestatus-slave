# livestatus-slave - Livestatus as webservice

livestatus-slave is a wrapper script to make the Livestatus unix socket
available via HTTP. This could be usefull when querying livestatus via
AJAX HTTP Request e.g. from JavaScript or mobile applications.

MKLivestatus is a Nagios Event Broker (NEB) Module which can be used to
extend the core of Nagios. The MKLivestatus module provides access to the
live status information kept in the running Nagios process. It serves a
unix socket for data exchange with external scripts/addons.
MKLivestatus homepage is http://mathias-kettner.de/checkmk_livestatus.html

# Requirements

livestatus-slave needs a webserver which supports at least PHP 5. PHP
needs suport for json and socket functions. You might need to install
additional packages to get those modules.

And you also need a running Nagios with a loaded MKLivestatus NEB module.

# Installation

Just drop the `live.php` somewhere on your system where it is reachable via
a webserver which supports PHP.

Then you can create the a configuration file in the same directory as the
`live.php` file is located, name it `live_conf.php`. You can simply rename
the file `live_conf.php-sample` from this repository and change it to fit
your needs.

# Example

I placed the `live.php` in my `nagios/share` directory so it can be accessed
via HTTP (my browser) now using this URL:

```
http://<my-nagios-server>/nagios/live.php
```

It is very easy to query the livestatus-slave. Simply access the `live.php`
in your browser with the following URL:

```
http://<my-nagios-server>/nagios/live.php?q=GET hosts\nColumns: name state\nFilter: name = www.nagvis.org\n
```

This will result in the following response:

```
[[0,"OK"],[["www.nagvis.org",0]]]
```

More readable and with comments added:

```
[
  // Header
  [
    // Response Code
    0,
    // Response Message
    "OK"
  ],
  // Body
  [["www.nagvis.org",0]]
]
```

The response is in JSON format. It is an array where the first element is the 
header which is an array itselfs and the second element is the response body
which may be an array of elements.

The response header is built of two elements. The first element is the response
code, the second element is the description of the response, for example an
error message.

The response code is 0 on a successful query and different than 0 when a
problem occured.

# Bugs and Support

I decided to use GitHub for managing project related communication, you
can find the project at (https://github.com/LaMi-/livestatus-slave).

The livestatus-slave was previously homed on my personal, a bit outdated, blog.
You might find some useful information there in the related articles or commennts
(http://nagios.larsmichelsen.com/livestatusslave/)

# Licensing

Copyright (C) 2014 Lars Michelsen <lm@larsmichelsen.com>

All outcome of the project is licensed under the terms of the GNU GPL v2.
Take a look at the LICENSE file for details.

# Thanks

Have fun and keep the spirit of open source!
