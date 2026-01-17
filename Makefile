CC = g++
CFLAGS = -target arm64-apple-macos11 -mmacosx-version-min=11.0 -std=c++2a
PACKAGES = curl neovim fzf

compile: 
	@$(CC) $(CFLAGS) $(arg) -o $(basename $(arg))

help: print
	echo "Help:\n"
	cat /Users/carlorosso/.config/Makefile

run: print
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
	sudo apt-get install $(PACKAGES) -y
	sudo apt update && sudo apt upgrade -y
	sudo curl https://sh.rustup.rs -sSf | sh
	source ~/.cargo/env
	sudo apt-get update && sudo apt-get upgrade -y
	sudo apt-get autoremove -y && sudo apt-get autoclean -y && sudo apt-get clean -y


# non resta che aprire alacritty aprire vim e digitare :Lazy sync

print:
	@echo "\n"
