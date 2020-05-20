setwd('/app')

openssl_conf <- "openssl.cnf"

Sys.setenv("OPENSSL_CONF" = openssl_conf)

library(webshot)
webshot('networkD3.html','network.png',delay = 2, selector = 'g.zoom-layer', zoom = 4)

Sys.unsetenv("OPENSSL_CONF")