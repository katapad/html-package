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


--

### for next version, TO DO LISTs

```shellscript
- set path which debug or deploy mode   
- run http server like as ruby webrick    
- add livereload function   
- publish as npm module this package  
```

