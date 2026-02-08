deploy:
	nix --extra-experimental-features 'nix-command flakes' build ".#darwinConfigurations.ymir.system"
	sudo ./result/sw/bin/darwin-rebuild switch --flake ".#"