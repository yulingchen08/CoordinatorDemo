fastlane documentation
----

# Installation

Make sure you have the latest version of the Xcode command line tools installed:

```sh
xcode-select --install
```

For _fastlane_ installation instructions, see [Installing _fastlane_](https://docs.fastlane.tools/#installing-fastlane)

# Available Actions

## iOS

### ios sync_all_match

```sh
[bundle exec] fastlane ios sync_all_match
```

Sync all match



- Sync appstore certificate & provisioning profile by match

- Sync development certificate & provisioning profile by match

### ios build

```sh
[bundle exec] fastlane ios build
```

Just build the project

### ios upload_testflight

```sh
[bundle exec] fastlane ios upload_testflight
```

upload testflight

### ios tests

```sh
[bundle exec] fastlane ios tests
```

Run unit test on the branch

----

This README.md is auto-generated and will be re-generated every time [_fastlane_](https://fastlane.tools) is run.

More information about _fastlane_ can be found on [fastlane.tools](https://fastlane.tools).

The documentation of _fastlane_ can be found on [docs.fastlane.tools](https://docs.fastlane.tools).
