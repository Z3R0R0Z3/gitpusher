#!/bin/bash
SAME_FOLDER=false

while [ $# -gt 0 ]; do
    case "$1" in
        --same-folder)
            SAME_FOLDER=true
            shift
            ;;
        *)
            echo "Unknown option: $1"
            exit 1
            ;;
    esac
done

REPO_ROOT=$(cd "$(dirname "$0")"/.. && pwd)
if ! $SAME_FOLDER; then  
    cd $REPO_ROOT
fi
script_filename="gitpusher"
gitignore_file=".gitignore"

if [ ! -f "$gitignore_file" ]; then
    touch "$gitignore_file"
fi

if grep -qxF "$script_filename" "$gitignore_file" >/dev/null 2>&1; then
    :  
else
    if [ ! -s "$gitignore_file" ] || [ -z "$(tail -c 1 "$gitignore_file")" ]; then
        echo "$script_filename" >> "$gitignore_file"
    else
        echo "" >> "$gitignore_file"
        echo "$script_filename" >> "$gitignore_file"
    fi
fi

add_modified_files() {
    while true; do
        read -p "Do you want to stage all modified files? [git add --all or git add] - (Y/n): " choice
        case "$choice" in
            [nN])
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
                ;;
            [yY]|"")  
                git add --all
                break
                ;;
            *)
                echo "Invalid input. Please enter Y or N."
                ;;
        esac
    done
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
echo ""
echo "Look at you, pushing code like a champ! All done and dusted!"
echo ""

echo "GGGGGGG   III  TTTTTTT  PPPPPP  U     U  SSSSSS  H    H  EEEEE  RRRRR "
echo "G        III     TTT    P    P  U     U  S       H    H  E      R    R"
echo "G  GGGG  III     TTT    PPPPPP  U     U  SSSSSS  HHHHHH  EEEE   RRRRR "
echo "G     G  III     TTT    P       U     U       S  H    H  E      R  R  "
echo " GGGGG   III     TTT    P        UUUUU   SSSSSS  H    H  EEEEE  R   RR"
echo ""

