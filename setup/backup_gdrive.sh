### BACKUP selected google drive folders into DROPBOX account ###

google_drive_folders_to_backup=(
  # Gitlab
  # Github
  # BitBucket
)

for FOLDER in "${google_drive_folders_to_backup[@]}"
do

    # If symbolic link already exists. Don't create again and evict recursion
    # test if file exists (test actual file, not symbolic link)
    if [ ! -e "$HOME/Dropbox/$FOLDER" ] ; then
      # symlink is broken or does not exist
      #ln -s <real_folder> <linked_folder>
      echo "=> Symbolic link broken or does not exit. Create it"
      #mkdir -p "$HOME/Google Drive/$FOLDER" # -p => creates parent directory if not exists
      echo "   Creating symbolic link to Google drive on Documents" $FOLDER
      ln -sfv "$HOME/Google Drive/$FOLDER" "$HOME/Dropbox/$FOLDER"
    fi

done

exit 1
