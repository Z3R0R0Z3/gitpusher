# GITPUSHER

This repository contains a script named `push.sh` that simplifies the process of staging, committing, and pushing changes to a Git repository.

## Usage

1. **Navigate to Your Project Directory:**
Change your current directory to your existing project directory:
   
2. **Clone this repository directly into your project directory:** 
This command will create a new directory named gitpusher in your project directory and clone the repository contents into it:

   ```bash
   git clone https://github.com/Z3R0R0Z3/gitpusher.git
   ```

3. **Copy the contents of the gitpusher directory:**
Use the cp command to copy the contents of the gitpusher directory into your main project directory. Assuming your gitpusher directory contains the push.sh script, you can do this:

   ```bash
   cp -r path/to/gitpusher/* .
   ```
   ``Replace path/to/gitpusher with the actual path to your gitpusher directory.`` 

4. **Make the Script Executable:**
Ensure that the push.sh script has executable permissions. If not, you can grant it using the following command:

   ```bash
   chmod +x push.sh
   ```
   
5. **Run the Script:**
Execute the script by running the following command:
   ```bash
   ./push.sh
   ```


6. **Follow the Prompts:**
The script will prompt you with instructions for staging modified files and entering commit messages.

     Follow the prompts to complete the staging, committing, and pushing process.

7. **Review Changes:**
After running the script, review the changes on GitHub to ensure they were successfully pushed.


## Notes
- You can clone the gitpusher repository directly into any existing project directory, regardless of the project type.
- If you encounter any issues or errors while using the script, please open an issue in this repository for assistance.
- Feel free to customize the script or suggest improvements by submitting a pull request.

