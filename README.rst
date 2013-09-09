html-package
=============

enable to develop static html pages
------------------------------------

author naowata, version 0.0.1

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
  sudo npm install bower


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

deploy
--------

::
  
  bundle exec middleman build
