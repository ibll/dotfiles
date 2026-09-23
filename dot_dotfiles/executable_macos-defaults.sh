# Change window radius
defaults write -g NSConvolutionOverride1 -float 10

# Allow control+command+click dragging
defaults write -g NSWindowShouldDragOnGesture -bool true
defaults write -g NSWindowShouldDragOnGestureFeedback -bool false

# Remove out-of-date popups for iWork
defaults write com.apple.iWork.Pages TSADisableUpdateNotifications -bool yes
defaults write com.apple.iWork.Keynote TSADisableUpdateNotifications -bool yes
defaults write com.apple.iWork.Numbers TSADisableUpdateNotifications -bool yes

# Disable annoying siri popup
mkdir -p /Library/Preferences/FeatureFlags/Domain &&
  defaults write /Library/Preferences/FeatureFlags/Domain/WritingTools LightweightUI_macOS -dict Enabled -bool false

# Change colour
defaults write -g NSColorSimulateHardwareAccent -bool true
defaults write -g NSColorSimulatedHardwareEnclosureNumber -int 7

# Dock
defaults write com.apple.dock mineffect -string suck
defaults write com.apple.dock autohide-delay -float 0
defaults write com.apple.dock autohide-time-modifier -float 0.12
