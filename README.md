# bundle-package

A wercker step to execute the `bundle package` command. The `bundle package` step will copy all .gem files into ./vendor/cache. The next time you will use `bundle install`, bundle will use the gems in this directory.

You should have bundler installed.

More information:

- http://gembundler.com/v1.3/bundle_package.html
- http://gembundler.com/v1.3/man/bundle-package.1.html

# What's new

- Remove PATH support, use cwd instead 

# Options

- `noprune` (optional, default: false) Don't remove stale gems from the cache.
- `all` (optional, default: true) Package `:git`, `:path` and `.gem` dependencies.

# Changelog

## 0.0.3

- Remove PATH support, use cwd instead 

## 0.0.2

- Initial release
