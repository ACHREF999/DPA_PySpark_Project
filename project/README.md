## Exporting a Notebook
You can download a notebook by opening it and navigating to `File > Download` in the main menu in the upper left corner.

Alternatively, it is possible to mount the volume specified in the `compose.yaml` file used to start the container on the host or another container.

## Directory Structure

- The directory `data` contains data files required for the task.
- The directory `workspace` contains the notebook(s) with the task description.

### Important
The `workspace` directory is backed by a volume. Thus, everything saved in this directory will be preserved when the container is removed by, for instance, executing `docker-compose down` or pressing Ctrl+C in interactive mode.

Everything else, **including the `data` directory**, will be lost.
