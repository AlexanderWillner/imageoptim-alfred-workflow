# Alfred ImageOptim Workflow

[![download](https://img.shields.io/github/downloads/AlexanderWillner/imageoptim-alfred-workflow/total)](https://github.com/AlexanderWillner/imageoptim-alfred-workflow/releases)

[ImageOptim](https://imageoptim.com/mac) removes bloated metadata. Saves disk space & bandwidth by compressing images without losing quality.

## Usage

To activate this workflow on one or multiple folders or files (JPG, PNG, GIF, or SVG) you've a number of possibilities. After a few seconds the image(s) should be compressed.

1. In Finder select your files/folders, invoke your hotkey for [Universal Actions](https://www.alfredapp.com/universal-actions/), then select ```Optimize Images```.
![Invoke](resources/invoke.png)
2. Or use a [File Buffer](https://www.alfredapp.com/help/features/file-search/#file-buffer) by invoking your [Alfred Hotkey](https://www.alfredapp.com/help/general/), typing the keyword `imageoptim`, typing the name of a file/folder, select multiple files using ⌥ + Arrow up, and finally pressing enter.
![File Buffer](resources/buffer.png)

## Caveats

Please note that [ImageOptim](https://imageoptim.com/mac) or related tools should be installed (e.g. via [brew](https://brew.sh)). Binaries that will be used (if installed):

* JPEG: `jpegtran`, `jpegoptim`
* GIF: `gifsicle`
* SVG: `svgcleaner`
* PNG: `pngcrush`, `advpng`, `oxipng`, `pngquant`, `zopflipng`, `pngout`

## Installing the Workflow

1. Simply download the [last release](https://github.com/AlexanderWillner/imageoptim-alfred-workflow/releases)
2. Unzip the file on your computer
3. Install `imageoptim.alfredworkflow` by double-clicking the workflow file and clicking on "Import".

You'll now see the workflow listed in the left sidebar of your Workflows preferences pane.

## Command Line

```bash
$ ./bin/imageoptim workflow/icon.png
Starting...
Optimizing workflow/icon.png with pngcrush...
Optimizing workflow/icon.png with advpng...
Optimizing workflow/icon.png with oxipng...
File already optimized
Optimizing workflow/icon.png with pngquant...
Optimizing workflow/icon.png with zopflipng...
Optimizing workflow/icon.png
Input size: 20875 (20K)
Result size: 20266 (19K). Percentage of original: 97.083%
Result is smaller

Optimizing workflow/icon.png with pngout...
Done.
```

## Details

To create a modified version of the workflow, edit the files and run ```make workflow``` to create an updated workflow.

## Disclaimer

This package has been inspired by [ramiroaraujo's Image Optim Alfred Workflow](https://github.com/ramiroaraujo/alfred-image-optim-workflow).
