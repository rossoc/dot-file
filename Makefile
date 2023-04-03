CC = g++
CFLAGS = -target arm64-apple-macos11 -mmacosx-version-min=11.0 -std=c++2a
PACKAGES = curl git golang-go python3 python3-pip luarocks ruby-full composer php cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev npm net-tools openssh-server ufw neovim nodejs fzf

compile: 
	@$(CC) $(CFLAGS) $(arg) -o $(basename $(arg))

help: print
	echo "Help:\n"
	cat /Users/carlorosso/.config/Makefile

run: compile print
	@$(basename $(arg))
	@rm $(basename $(arg))

%.o: %.cpp 
	@$(CC) $< $(CFLAGS) -o $@

clear: print
	rm *.o

test: $(basename $(arg)).in print
	@cat $(basename $(arg)).in | $(basename $(arg))

setup_ubuntu:
	sudo apt_get install software-properties-common -y
	sudo add-apt-repository ppa:neovim-ppa/stable -y
	sudo apt-get update -y
	curl -sL https://deb.nodesource.com/setup_18.x -o nodesource_setup.sh
	cd ~
	sudo bash nodesource_setup.sh
	sudo apt-get install $(PACKAGES) -y
	sudo apt update && sudo apt upgrade -y
	sudo curl https://sh.rustup.rs -sSf | sh
	source ~/.cargo/env
	git clone https://github.com/jwilm/alacritty.git
	cd alacritty
	cargo build --release
	sudo cp target/release/alacritty /usr/local/bin
	sudo cp extra/logo/alacritty-term.svg /usr/share/pixmaps/Alacritty.svg
	sudo apt-get update && sudo apt-get upgrade -y
	sudo apt-get autoremove -y && sudo apt-get autoclean -y && sudo apt-get clean -y
	sudo ufw allow ssh
	cd ~/.ssh
	curl https://github.com/Danesinoo.keys | cat >> authorized_keys
	curl https://github.com/Pietro-Putelli.keys | cat >> authorized_keys


# non resta che aprire alacritty aprire vim e digitare :Lazy sync

print:
	@echo "\n"
