SHELL := /usr/bin/env bash

.DEFAULT_GOAL := help
define BROWSER_PYSCRIPT
import webbrowser
webbrowser.open("docs/_build/html/index.html")
endef
export BROWSER_PYSCRIPT

define PRINT_HELP_PYSCRIPT
import re, sys

for line in sys.stdin:
	match = re.match(r'^([a-zA-Z_-]+):.*?## (.*)$$', line)
	if match:
		target, help = match.groups()
		print("%-40s %s" % (target, help))
endef
export PRINT_HELP_PYSCRIPT
BROWSER := python -c "$$BROWSER_PYSCRIPT"

help: ## Print this help
	@python -c "$$PRINT_HELP_PYSCRIPT" < $(MAKEFILE_LIST)

.PHONY: hooks
hooks:
	test -f .git/hooks/pre-commit || cp hooks/pre-commit .git/hooks/pre-commit


.PHONY: bootstrap
bootstrap: hooks ## Build development environment
	pip install -r requirements.txt

.PHONY: bootstrap-ci
bootstrap-ci:  ## Build environment for CI
	pip install -r requirements-ci.txt

.PHONY: lint
lint:  ## Check code style
	yamllint \
		.github/workflows
	terraform fmt -check -recursive


.PHONY: format
format:  ## Format terraform files
	terraform fmt -recursive

.PHONY: init
init:
	terraform init

.PHONY: plan
plan: init ## Run terraform plan
	set -o pipefail ; terraform plan -var-file=configuration.tfvars --out=tf.plan 2> plan.stderr | tee plan.stdout || (cat plan.stderr; exit 1)


.PHONY: apply
apply: ## Run terraform apply
	terraform apply -auto-approve -input=false tf.plan

.PHONY: clean
clean: ## Remove generated files
	rm -fr .terraform
	rm -f .terraform.lock.hcl
	rm -f plan.stderr plan.stdout tf.plan
