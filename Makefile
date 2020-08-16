CHARTS ?= $(shell find fnichol -type d -depth 1)
BUILD_TOOLS += helm cr git
BUILD_DIR ?= .build

include vendor/mk/base.mk

build: $(CHARTS) ## Builds the Helm packages
.PHONY: build

test: ## Runs all tests
.PHONY: test

check: ## Checks all linting, styling, & other rules
.PHONY: check

clean: ## Cleans up project
	@echo "--- $@"
	rm -rf $(BUILD_DIR)
.PHONY: clean

$(CHARTS): buildtools
	@echo "--- $@"
	helm package $@ --destination $(BUILD_DIR)
.PHONY: $(CHARTS)

upload: ## Uploads the built Helm packages
	@echo "--- $@"
	cr upload
.PHONY: upload

index: ## Updates the Helm Chart index
	@echo "--- $@"
	cr index -c https://fnichol.github.io/charts -i docs/index.yaml
	git add docs/index.yaml
	git commit -m 'chore(index): update `docs/index.yaml`'
.PHONY: index

release: ## Publish and release a new version of a Helm Chart
	@echo "--- $@ ($(CHART))"
	git push origin HEAD
	$(MAKE) clean $(CHART) upload index
.PHONY: release
