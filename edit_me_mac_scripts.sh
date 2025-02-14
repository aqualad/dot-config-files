# Disable autocorrect in Notes
#  This might work: Edit>Spelling and Grammar>Correct Spelling Automatically
#  But if not, try running below
# defaults write com.apple.notes NSAutomaticSpellingCorrectionEnabled -bool false

# Enable autocorrect in Notes
# defaults delete com.apple.notes NSAutomaticSpellingCorrectionEnabled

# Prevent Spotlight from indexing caches that update frequently
#  https://apple.stackexchange.com/a/144494
#  https://apple.stackexchange.com/a/389360
sudo mdutil -a -i off
touch ~/Library/Caches/Google/Chrome/.metadata_never_index
touch ~/Library/Application\ Support/Spotify/PersistentCache/.metadata_never_index
touch ~/Library/Containers/com.docker.docker/.metadata_never_index
touch ~/Library/Application\ Support/Code/.metadata_never_index
sudo mdutil -a -i on
# Recreate indices
# sudo mdutil -Ea
