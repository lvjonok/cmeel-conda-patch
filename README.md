# cmeel-conda-patch

This repository is just a quick-fix to a possible problem of the [cmeel-based]() packages not being able to find the required shared libraries in runtime.

This patch appends to the `LD_LIBRARY_PATH` environment variable on `conda activate` and removes on `conda deactivate`.

## How to use?

Make sure you have `conda` installed.

### Hard way

1. Clone this repository
2. Run `./patch.sh <conda env name>` (e.g. `./patch.sh planning`) to patch the environment
