# Remote File Utils
A collection of bash scripts for managing files on remote servers.

## Usage

### Deploy files to a remote server

To deploy files to a remote server, use the `deploy-to-remote-server.sh` script. 

To use this script, you need to provide the following variables:

- `REMOTE_HOST`: The address of the remote server.
- `REMOTE_DIR`: The path to the directory on the remote server where the files should be deployed.
- `DEPLOY_DIR`: The path to the local directory containing the files to be deployed.

```bash
./deploy-to-remote-server.sh /path/to/deploy_configs
```

### Copy files from a remote server
To copy files from a remote server to your local machine, use the `copy-from-remote-server.sh` script. 

To use this script, you need to provide the following variables:

- `REMOTE_SERVER`: The address of the remote server.
- `REMOTE_PATH`: The path to the directory on the remote server containing the files to be copied.
- `LOCAL_PATH`: The path to the local directory where the files should be copied.

To run the script, open a terminal and navigate to the directory containing the script. Then, enter the following command:

```bash
./copy-from-remote-server.sh /path/to/copy_configs /path/to/filter_file
```

### Config and Filter Files

Both `deploy-to-remote-server.sh` and `copy-from-remote-server.sh` require two additional files: a config file and a filter file.

The config file should be a plain text file containing the values of the required variables (either `REMOTE_HOST`, `REMOTE_DIR`, and `DEPLOY_DIR` for `deploy-to-remote-server.sh` or `REMOTE_SERVER`, `REMOTE_PATH`, and `LOCAL_PATH` for `copy-from-remote-server.sh`). Each variable should be on a separate line, with no additional whitespace.

The filter file should contain the rsync filter rules for the deployment or copy. Refer to the rsync documentation for more information on creating filter rules.







## License
This project is licensed under the MIT License. See the [LICENSE](LICENSE.md) file for details.
