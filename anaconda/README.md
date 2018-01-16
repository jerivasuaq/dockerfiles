
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
<Location /ipython>
ProxyPass        http://localhost:8888/ipython
ProxyPassReverse http://localhost:8888/ipython
ProxyPassReverseCookieDomain localhost my.server.com
RequestHeader set Origin "http://localhost:8888"
</Location>

<Location /ipython/api/kernels/>
ProxyPass        ws://localhost:8888/ipython/api/kernels/
ProxyPassReverse ws://localhost:8888/ipython/api/kernels/
</Location>
```



