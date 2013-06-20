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

#### auto compile files when the file has saved

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
- create folder if there is no one <- need to early !;(
- set path which debug or deploy mode   
- set setting.json ad enable to modify only the json file not Gruntfile
- add livereload function   
```

