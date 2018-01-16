
Install guide:

https://github.com/jupyterhub/jupyterhub/wiki/Installation-of-Jupyterhub-on-remote-server

Another great guide
------------------------------

https://github.com/LordOfTheRats/Jupyter-docker


Kernels guide
------------------------------

https://github.com/jupyter/jupyter/wiki/Jupyter-kernels


Cling kernel
--------------------------------

https://github.com/root-project/cling/tree/master/tools/Jupyter

R Kernel
--------------------------------
https://anaconda.org/r/r-irkernel
https://anaconda.org/search?q=kernel


Apache conf
-------------------------------------

``` bash
sudo a2enmod headers proxy proxy_http proxy_wstunnel
```

sudo vim /etc/apache2/conf-enabled/jupyter.conf
``` 
ProxyPassReverse http://localhost:8000/jupyter
ProxyPassReverseCookieDomain localhost jupyter.ingenieria.uaq.mx
RequestHeader set Origin "http://localhost:8000"
</Location>


<LocationMatch "/jupyter/(user/[^/]*)/(api/kernels/[^/]+/channels|terminals/websocket)(.*)">
    ProxyPassMatch ws://localhost:8000/jupyter/$1/$2$3
    ProxyPassReverse ws://localhost:8000
</LocationMatch>
```

