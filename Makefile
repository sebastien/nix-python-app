SOURCES_PY:=$(wilcard *.py src/py/*/*.py)
SOURCES_BIN:=$(wilcard bin/*)
SOURCES_NIX:=$(wilcard *.nix)
SOURCES:=$(SOURCES_PY) $(SOURCES_NIX)

DOCKER:=sudo docker

# # Functions
mkdir-parent=$(shell if [ ! -d "$(dir $(1))" ]; then mkdir "$(dir $(1))"; fi; echo "$(1)")

# # Main rules

shell: shell.nix FORCE
	@nix-shell shell.nix

run-shell: shell.nix FORCE
	$(info Running from Nix shell)
	@nix-shell shell.nix --run "python -m nixpythonapp"

run-container: build/container.docker.id FORCE
	@echo "Running container ID: $$(cat "$<")"
	@$(DOCKER) run -t "$$(cat "$<")"

clean: FORCE
	 @nix-collect-garbage -d

# # Build rules

build/%.nix.build: %.nix $(SOURCES)
	@nix-build -o "$(call mkdir-parent,$@)" "$<"

build/%.docker.id: build/%.nix.build
	@$(DOCKER) load < "$<" | tail -n1 | cut -d: -f2- | tr -d ' ' | tee "$@"

# # Makefile boilerplate
FORCE:

PHONY: shell container run-docker clean
# EOF
