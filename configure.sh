# Enable touch id in terminal
grep -qxF 'auth sufficient pam_tid.so' /etc/pam.d/sudo || echo 'auth sufficient pam_tid.so' | sudo tee -a /etc/pam.d/sudo

# Enable three finger drag
defaults write com.apple.AppleMultitouchTrackpad DragLock -bool false
defaults write com.apple.AppleMultitouchTrackpad Dragging -bool false
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerDrag -bool true