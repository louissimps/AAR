#AAR#
This cookbook will create a working version of the Awesome Appliance App running in vagrant.

There are also tests that check for existence of Apache/Mysql/Git

##Pre-requisites##
* ChefDK
* Vagrant
* Virtualbox

#If you don't have Homebrew on osx
```
$ /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```
Install tools
```
$ brew cask install virtualbox
$ brew cask install vagrant
$ brew cask install chefdk
```

First thing is to clone the repo and install the dependencies from Gemfile

```
$ git clone git@github.com:louissimps/AAR.git
$ cd AAR
$ bundle install
```

Now we can run kitchen test/verify/converge
```
$ kitchen verify
$ kitchen test
$ kitchen converge
```


After running converge you can launch a browser:
[Awesome Appliance Repair Demo](http://localhost:8080)
