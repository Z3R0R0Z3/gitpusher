#!/bin/bash
add_modified_files() {
    read -p "Do you want to stage all modified files? (Y/n): " choice
    case "$choice" in
        [nN])
            while true; do
                read -p "Enter the filenames you want to stage (separated by spaces): " files_to_add
                 git add $files_to_add > /dev/null 2>&1
                if [ $? -eq 0 ]; then
                    if [ -z "$files_to_add" ]; then
                        echo "No files were added. Please try again."
                    else
                        break
                    fi
                else
                    echo "One or more files provided do not exist. Please try again."
                fi
            done
            ;;
        *)
            git add --all
            ;;
    esac
}
commit_and_push() {
    read -p "Enter your commit message: " commit_message
    if [ -z "$commit_message" ]; then
        echo "Commit message cannot be empty. Aborting."
        exit 1
    fi
    git commit -m "$commit_message" && git push
}
git status --short
add_modified_files
    if git status | grep -q "nothing to commit"; then
        echo "No changes to commit."
        exit 1 
    fi
git status --short
commit_and_push