###############################################################################
# SPDX-License-Identifier: MIT
# Copyright (c) 2021 [Alexander Willner](alex@willner.ws)
#
# Alfred Workflow to optimize images.
###############################################################################


# setup #######################################################################
SHELL=bash
WORKFLOW=imageoptim

run = @echo "Running $(1)..." ; if ! type "$(1)" >/dev/null 2>&1 ; then echo "SKIPPED: Install '$(1)' first." >&2 ; else $(1) $(3) $(2) ; fi
###############################################################################


# main target and helper targets ##############################################
help: ## Print help for each target
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make \033[36m\033[0m\n"} \
	  /^[$$()% 0-9a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2 } \
	  /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)

workflow: ## Build workflow file
	@rm -f workflow/$(WORKFLOW).alfredworkflow
	@zip -qj workflow/$(WORKFLOW).alfredworkflow workflow/icon.png workflow/info.plist bin/imageoptim README.md
	@echo "Workflow file 'workflow/$(WORKFLOW).alfredworkflow' created."

feedback: ## Send feedback
	@open https://github.com/AlexanderWillner/imageoptim-alfred-workflow

lint: ## Check for lint errors
	@$(call run,shfmt,$(WORKFLOW),-i 2 -w -s) # https://github.com/mvdan/sh
	@$(call run,shellcheck,$(WORKFLOW)) # https://github.com/koalaman/shellcheck
	@$(call run,shellharden,$(WORKFLOW),--check) # https://github.com/anordal/shellharden

.PHONY: workflow feedback lint
###############################################################################
