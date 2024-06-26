.DEFAULT_GOAL := help

help:  ## Show this help.
	@grep -E '^\S+:.*?## .*$$' $(firstword $(MAKEFILE_LIST)) | \
		awk 'BEGIN {FS = ":.*?## "}; {printf "%-30s %s\n", $$1, $$2}'

.PHONY: build-android-testflight
build-android-testflight: ## Build on EAS the Android version with the 'testflight' profile
	yarn build:android:testflight

.PHONY: install-from-lock
install-from-lock: ## Install dependencies from the lock file
	yarn install --frozen-lockfile

.PHONY: install-from-package
install-from-package: ## Install dependencies from the lock file
	yarn install

.PHONY: local-setup
local-setup: ## Set up the local environment (e.g. install git hooks)
	scripts/local-setup.sh

.PHONY: list-outdated-dependencies
list-outdated-packages: ## List the outdated packages' dependencies
	yarn outdated

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

.PHONY: fix-all
fix-all: fix-lint fix-format ## Fix linting and format

.PHONY: check-types
check-types: ## Check types
	yarn typecheck

# https://docs.expo.dev/more/expo-cli/
.PHONY: check-expo
check-expo: ## Run the expo doctor (e.g. common issues in config files, dependencies, yarn versions, etc.)
	npx expo-doctor

.PHONY: check-expo-dependencies
check-expo-dependencies: ## Check if the Expo dependencies are up to date
	npx expo install --check

.PHONY: fix-expo-dependencies
fix-expo: ## Fix the Expo dependencies
	npx expo install --fix

.PHONY: test
test: ## Run all the tests
	yarn test

.PHONY: pre-commit
pre-commit: lint check-format check-types test ## Run the pre-commit tasks

.PHONY: pre-push
pre-push: check-expo ## Run the pre-push tasks
