html-package
=============

this enables to develop a static html pages easily
-------------------------------------------------------

| @author naowata
| @version 0.0.1
| @last-update 2013/9/9

versions
----------------------------


::

  ruby -v # 2.0.0p0 
  gem -v # 2.0.3
  node -v # v0.10.10


install and set envrioments
----------------------------

::

  sudo gem install middleman
  sudo npm install bower -g


how to use
-----------

::

  mkdir YOUR_PROJECTS && cd YOUR_PROJECTS
  git init
  git pull git://github.com/naoiwata/html-package.git
  bundle install --path vendor/bundle
  # after set js library on bower.json
  bower install
  

run web server
---------------

::
  
  bundle exec middleman server
  

u can use liverealod tool -> https://chrome.google.com/webstore/detail/livereload/jnihajbhpnppcggbcgedagnkighmdlei


deploy
--------

::
  
  bundle exec middleman build
  
  
for next versions
------------------

- set optimized image files compressed
- set file path on debug and deploy
- transport file by using ftp or sftp
- add compass develop env
