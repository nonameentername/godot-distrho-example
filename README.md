# godot-distrho-example

A really simple Godot project that uses [godot-distrho](https://github.com/nonameentername/godot-distrho/) and [godot-csound](https://github.com/nonameentername/godot-csound/) to build a simple synthesizer audio plugin.

Currently works with **Godot 4.7 stable**.

## Build

### 1. Install the dependencies

Run the following command from the project directory:

```bash
godot --headless -s package.gd install
```

### 2. Import the Godot resources

```bash
godot --headless --import
```

### 3. Open the project

```bash
godot --editor project.godot
```

## Export the Plugin

Export the Linux LV2 audio plugin:

```bash
godot --headless --export-debug "Linux"
```

## Install the Plugin

Copy the Linux LV2 plugin to your local LV2 directory:

```bash
mkdir -p ~/.lv2
cp -r build/linux/godot-distrho-example.lv2 ~/.lv2/
```
