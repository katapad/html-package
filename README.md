## html-package

#### install node if your env doesn't have

```shellscript
$ sh config/node.sh
```
 
 
 
#### install node modules

```shellscript
$ sh config/install.sh
```

#### compile files

```shellscript
$ grunt
```

#### auto compile files when the file has saved, and browser reloaded when file has saved.  

- install livereload extension and run : [Google Chrome](https://chrome.google.com/webstore/detail/livereload/jnihajbhpnppcggbcgedagnkighmdlei)  

```shellscript
$ grunt watch
```

#### run web server on webrick and you can see 'http://localhost:8080/dist/' on dist/index.html file

```shellscript
$ ruby config/server.rb 
``` 

#### test command if the sftp can be able to be connected the host server

```shellscript
$ grunt sshexec
``` 

#### transport dist files to sftp server

```shellscript
$ grunt sftp
``` 


--

### for next version, TO DO LISTs

```shellscript
- set paths which debug or deploy mode     
- set like a setting.json as enable us to modify only this json file not Gruntfile  
```

