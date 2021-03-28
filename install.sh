# update  font cache
sudo fc-cache -f -v

#update repo cache
sudo apt -y update && upgrade

#install node js
sudo curl -sL https://deb.nodesource.com/setup_14.x | sudo bash -
sudo apt-get install -y nodejs

# install material design icons
sudo npm -g install material-design-icons

#download golang
wget -c https://dl.google.com/go/go1.14.4.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf go1.14.4.linux-amd64.tar.gz
echo -e "\n export PATH=$PATH:/usr/local/go/bin:$HOME/go/bin" >> $HOME/.profile
source $HOME/.profile

go get -u github.com/nsf/gocode
go get -u github.com/rogpeppe/godef
go get -u github.com/jstemmer/gotags
go get -u github.com/kisielk/errcheck
go get -u golang.org/x/tools/cmd/guru
go get -u github.com/golang/lint/golint
go get -u golang.org/x/tools/cmd/gorename
go get -u golang.org/x/tools/cmd/goimports
go get -u golang.org/x/tools/cmd/godoc
