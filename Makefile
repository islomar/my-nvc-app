.DEFAULT_GOAL := help

help:  ## Show this help.
	@grep -E '^\S+:.*?## .*$$' $(firstword $(MAKEFILE_LIST)) | \
		awk 'BEGIN {FS = ":.*?## "}; {printf "%-30s %s\n", $$1, $$2}'

.PHONY: install
install: ## Install dependencies from the lock file
	yarn install --frozen-lockfile

.PHONY: local-setup
local-setup: ## Set up the local environment (e.g. install git hooks)
	scripts/local-setup.sh

.PHONY: lint
lint: ## Run the linter
	yarn lint

.PHONY: fix-lint
fix-lint: ## Fix the linter
	yarn lint --fix

.PHONY: check-format
check-format: ## Fix format
	yarn prettier --check .

.PHONY: fix-format
fix-format: ## Fix format
	yarn prettier --check --write .

.PHONY: test
test: ## Run all the tests
	yarn test

.PHONY: pre-commit
pre-commit: lint check-format test ## Run the pre-commit tasks
