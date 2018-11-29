DIR      = .
NIX_DIR  = $(DIR)/nix
NIX_DEPS = $(DIR)/nix-deps

DIRS = $(NIX_DIR) $(NIX_DEPS)

$(info $(shell mkdir -p $(DIRS)))

.PHONY : default
default:
	@echo "No default action"

# To override existing: make -B default.nix
$(DIR)/default.nix :
	cabal2nix . > default.nix

$(DIR)/default-example.nix :
	cabal2nix . --flag examples > default-examples.nix

# Example: make -B ./nix/nixpkgs.git.json
$(NIX)/%.git.json : $(NIX)/%.git.sh
	sh $< > $@

# Example: make -B ./nix/groundhog-ghcjs.nix
$(NIX_DEPS)/%.nix : $(NIX_DEPS)/%.sh
	sh $< > $@
