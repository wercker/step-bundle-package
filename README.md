# bundle-package

A wercker step to execute the `bundle package` command. The `bundle package` step will copy all .gem files into ./vendor/cache. The next time you will use `bundle install`, bundle will use the gems in this directory.

You should have bundler installed.

More information:
- http://gembundler.com/v1.3/bundle_package.html
- http://gembundler.com/v1.3/man/bundle-package.1.html

## Arguments

### noprune
- type: boolean
- optional: true (default: false)
- description: Don't remove stale gems from the cache.

### all
- type: boolean
- optional: true (default: true)
- description: Package `:git`, `:path` and `.gem` dependencies.