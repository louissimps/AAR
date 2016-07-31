# AAR

#AAR#
This cookbook will create a working version of the Awesome Appliance App running in vagrant.

There are also tests that check for existence of Apache/Mysql/Git

##Pre-requisites##
ChefDK
Vagrant
Virtualbox

#If you don't have Homebrew on osx
```
~/P❯❯❯ /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```
Install tools
```
~/P❯❯❯ brew cask install virtualbox
~/P❯❯❯ brew cask install vagrant
~/P❯❯❯ brew cask install chefdk
```

First thing is to clone the repo and install the dependencies from Gemfile

```
~/P❯❯❯ git clone git@github.com:louissimps/AAR.git
~/P❯❯❯ cd AAR
~/P❯❯❯ bundle install
```

Now we can run kitchen test/verify/converge
```
~/P❯❯❯ kitchen verify
~/P❯❯❯ kitchen test
~/P❯❯❯ kitchen converge
```


After running converge you can launch a browser:
[Awesome Appliance Repair Demo](http://localhost:8080)
