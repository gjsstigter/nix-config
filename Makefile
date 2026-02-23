deploy:
	nix --extra-experimental-features 'nix-command flakes' build ".#darwinConfigurations.ymir.system"
	sudo ./result/sw/bin/darwin-rebuild switch --flake ".#"
	brew bundle

install:
	curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix/tag/v3.2.1 | sh -s -- install
