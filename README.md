# Nix-Darwin Configuration

A modular nix-darwin configuration for macOS.

## Structure

```
.
├── flake.nix              # Main flake configuration
├── modules/               # System-level modules
│   ├── system.nix        # System settings, users, defaults
│   ├── packages.nix      # System packages
│   └── homebrew.nix      # Homebrew configuration
└── home/                  # Home-manager configurations
    └── home.nix          # User home configuration
```

## Modules

### flake.nix
- Defines all inputs (nixpkgs, nix-darwin, home-manager, etc.)
- Imports all modules
- Configures nix-homebrew
- Sets up home-manager integration
- Defines variables used across modules

### modules/system.nix
- Nix settings (experimental features, unfree packages)
- System configuration (state version, primary user)
- User account setup
- Shell configuration (fish)
- macOS system defaults (Dock, Finder, etc.)

### modules/packages.nix
- System-wide packages installed via Nix
- Organized by category (editors, IDEs, utilities, etc.)

### modules/homebrew.nix
- Homebrew cask installations
- Homebrew settings and cleanup behavior

### home/home.nix
- User-specific configurations via home-manager
- Currently minimal, ready for expansion
- Examples for Git, Fish shell configuration included (commented out)

## Usage

### Initial setup
```bash
darwin-rebuild switch --flake .#ymir
```

### After changes
```bash
darwin-rebuild switch --flake .
```

### Update inputs
```bash
nix flake update
```

## Customization

### Variables
Edit the `vars` section in `flake.nix` to change:
- Username
- Hostname
- Default browser

### Adding packages
- **Nix packages**: Add to `modules/packages.nix`
- **Homebrew casks**: Add to `modules/homebrew.nix`

### System settings
Edit `modules/system.nix` to modify macOS defaults.

### User configuration
Edit `home/home.nix` for user-specific settings like:
- Git configuration
- Shell aliases and functions
- Dotfiles
- Application configurations

## Future improvements

You might want to add:
- Separate module for macOS system defaults (keyboard, trackpad, etc.)
- Multiple user configurations
- Development environment modules (per language)
- Dotfiles management via home-manager
- Secrets management (agenix, sops-nix)
