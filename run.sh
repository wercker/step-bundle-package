#!/bin/sh

# First make sure bundler is installed
if ! type bundle &> /dev/null ; then
    fail "bundler not found, make sure you have it installed"
else
    info "bundler is available"
    debug "bundle version: $(bundle --version)"
fi

bundle_command="bundle package"
bundle_working_path=""

# Parse some variable arguments
if [ "$WERCKER_BUNDLE_PACKAGE_NOPRUNE" = "true" ] ; then
    bundle_command="$bundle_command --no-prune"
fi

if [ "$WERCKER_BUNDLE_PACKAGE_ALL" = "true" ] ; then
    bundle_command="$bundle_command --all"
fi

# Figure out the working directory
if [ -n "$WERCKER_BUNDLE_PACKAGE_PATH" ] ; then
  bundle_working_path="$WERCKER_BUNDLE_PACKAGE_PATH"
else
  bundle_working_path="$WERCKER_SOURCE_DIR"
fi

# Stop processing if the working path was not found
if [ ! -e "$bundle_working_path/Gemfile" ] && [ ! -e "$bundle_working_path/gemfile" ] ; then
    warn "Skipping bundle package because Gemfile was not found in $bundle_working_path"
else
    debug "Gemfile and bundler found."

    info "Switching to path: $bundle_working_path"
    cd $bundle_working_path

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