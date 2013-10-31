#!/bin/sh

# First make sure bundler is installed
if ! type bundle &> /dev/null ; then
    fail "bundler not found, make sure you have it installed"
else
    info "bundler is available"
    debug "bundle version: $(bundle --version)"
fi

bundle_command="bundle package"

# Parse some variable arguments
if [ "$WERCKER_BUNDLE_PACKAGE_NOPRUNE" = "true" ] ; then
    bundle_command="$bundle_command --no-prune"
fi

if [ "$WERCKER_BUNDLE_PACKAGE_ALL" = "true" ] ; then
    bundle_command="$bundle_command --all"
fi

# Stop processing if the working path was not found
if [ ! -e "$PWD/Gemfile" ] ; then
    warn "Skipping bundle package because Gemfile was not found in $PWD"
else
    debug "Gemfile and bundler found."

    debug "$bundle_command"
    $bundle_command

    if [[ $? -ne 0 ]]
    then
        warn "$result"
        fail "bundle package command failed"
    else
        success "finished $bundle_command"
    fi
fi
