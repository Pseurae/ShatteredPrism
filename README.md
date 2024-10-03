<p align="center">
<picture>
  <source media="(prefers-color-scheme: dark)" srcset="/program_info/shatteredprism-header.svg">
  <source media="(prefers-color-scheme: light)" srcset="/program_info/shatteredprism-header.svg">
  <img alt="ShatteredPrism" src="/program_info/shatteredprism-header.svg" width="40%">
</picture>
</p>

<p align="center">
  ShatteredPrism is a custom launcher for Minecraft that allows you to easily manage multiple installations of Minecraft at once.<br />
  <br />This is a <b>fork</b> of PrismLauncher and is <b>not</b> endorsed by it.
</p>

# Advantages over PrismLauncher

- Completely DRM-Free.
- In-App FTB Modpack Downloading restored.
- Support 3rd Party Auth Servers(courtesy of [this project](https://github.com/fn2006/PollyMC/)).


## Installation

- Downloads can be found on the [GitHub Releases](https://github.com/LunaisLazier/ShatteredPrism/releases).
- Last build status can be found in the [GitHub Actions](https://github.com/LunaisLazier/ShatteredPrism/actions) tab (this also includes the pull requests status).

## Community & Support

Feel free to create a GitHub issue if you find a bug or want to suggest something, it is currently the **only** way to contact anyone regarding this project.

Do **not** ask for support on any of the official PrismLauncher channels as they cannot be held responsible for any issues caused by the changes made.


## License [![https://github.com/PrismLauncher/PrismLauncher/blob/develop/LICENSE](https://img.shields.io/github/license/PrismLauncher/PrismLauncher?label=License&logo=gnu&color=C4282D)](LICENSE)

All launcher code is available under the GPL-3.0-only license.

The logo and related assets are under the CC BY-NC-SA 4.0 license.

## Building

To build the launcher yourself, follow [the instructions on the Prism Launcher website](https://prismlauncher.org/wiki/development/build-instructions) but clone this repo instead.

## Notes

- You can easily use a custom version of authlib-injector on an instance. Select the instance in the main window, click "Edit" (or Ctrl+I/Command+I), go to the Version tab, click "Add Agents", and select your authlib-injector JAR. If your JAR is not correctly identified as authlib-injector, make sure the `Agent-Class` field in the JAR's MANIFEST.MF is `moe.yushi.authlibinjector.Premain`.
