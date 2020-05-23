print(Sys.getlocale())

openssl_conf <- "app/openssl.cnf"
Sys.setenv("OPENSSL_CONF" = openssl_conf)
webshot::webshot('app/networkD3.html','network.png',delay = 2, selector = 'g.zoom-layer', zoom = 4)
Sys.unsetenv("OPENSSL_CONF")