#
# macos/defaults/general.sh
#
# @author  Matias Bynens <https://mathiasbynens.be>
# @author  Denis Luchkin-Zhou <wyvernzora@gmail.com>
# @license MIT
#


#
# Set computer name (as done via System Preferences → Sharing)
#
# sudo scutil --set ComputerName "0x6D746873"
# sudo scutil --set HostName "0x6D746873"
# sudo scutil --set LocalHostName "0x6D746873"
# sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string "0x6D746873"


#
# Set standby delay to 24 hours (default is 1 hour)
#
sudo pmset -a standbydelay 86400


#
# Disable the sound effects on boot
#
sudo nvram SystemAudioVolume=" "


#
# Disable transparency in the menu bar and elsewhere on Yosemite
#
# defaults write com.apple.universalaccess reduceTransparency -bool true


#
# Menu bar: hide the Time Machine, Volume, and User icons
#
for domain in ~/Library/Preferences/ByHost/com.apple.systemuiserver.*; do
	defaults write "${domain}" dontAutoLoad -array \
		"/System/Library/CoreServices/Menu Extras/TimeMachine.menu" \
		"/System/Library/CoreServices/Menu Extras/Volume.menu" \
		"/System/Library/CoreServices/Menu Extras/User.menu"
done
defaults write com.apple.systemuiserver menuExtras -array \
	"/System/Library/CoreServices/Menu Extras/Bluetooth.menu" \
	"/System/Library/CoreServices/Menu Extras/Battery.menu" \
	"/System/Library/CoreServices/Menu Extras/Clock.menu"


#
# Set highlight color to green
#
# defaults write NSGlobalDomain AppleHighlightColor -string "0.764700 0.976500 0.568600"


#
# Set sidebar icon size to medium
#
defaults write NSGlobalDomain NSTableViewDefaultSizeMode -int 2


#
# Always show scrollbars
#
defaults write NSGlobalDomain AppleShowScrollBars -string "WhenScrolling"
# Possible values: `WhenScrolling`, `Automatic` and `Always`


#
# Disable the over-the-top focus ring animation
#
defaults write NSGlobalDomain NSUseAnimatedFocusRing -bool false



# Disable smooth scrolling
# (Uncomment if you’re on an older Mac that messes up the animation)
#
# defaults write NSGlobalDomain NSScrollAnimationEnabled -bool false


#
# Increase window resize speed for Cocoa applications
#
defaults write NSGlobalDomain NSWindowResizeTime -float 0.001


#
# Double-click a window's title bar to minimize
#
defaults write NSGlobalDomain AppleMiniaturizeOnDoubleClick -bool false

#
# Expand save panel by default
#
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true


#
# Expand print panel by default
#
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true


#
# Save to disk (not to iCloud) by default
#
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false


#
# Automatically quit printer app once the print jobs complete
#
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true


#
# Disable the “Are you sure you want to open this application?” dialog
#
# defaults write com.apple.LaunchServices LSQuarantine -bool false


#
# Remove duplicates in the “Open With” menu (also see `lscleanup` alias)
#
/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user


# Display ASCII control characters using caret notation in standard text views
# Try e.g. `cd /tmp; unidecode "\x{0000}" > cc.txt; open -e cc.txt`
defaults write NSGlobalDomain NSTextShowsControlCharacters -bool true


#
# Disable Resume system-wide
#
defaults write com.apple.systempreferences NSQuitAlwaysKeepsWindows -bool false


#
# Disable automatic termination of inactive apps
#
defaults write NSGlobalDomain NSDisableAutomaticTermination -bool true


#
# Disable the crash reporter
#
# defaults write com.apple.CrashReporter DialogType -string "none"


#
# Set Help Viewer windows to non-floating mode
#
defaults write com.apple.helpviewer DevMode -bool true


#
# Fix for the ancient UTF-8 bug in QuickLook (https://mths.be/bbo)
# Commented out, as this is known to cause problems in various Adobe apps :(
# See https://github.com/mathiasbynens/dotfiles/issues/237
#
# echo "0x08000100:0" > ~/.CFUserTextEncoding


#
# Reveal IP address, hostname, OS version, etc. when clicking the clock
# in the login window
#
sudo defaults write /Library/Preferences/com.apple.loginwindow AdminHostInfo HostName


#
# Restart automatically if the computer freezes
#
sudo systemsetup -setrestartfreeze on


#
# Never go into computer sleep mode
#
# sudo systemsetup -setcomputersleep Off > /dev/null


#
# Disable Notification Center and remove the menu bar icon
#
# launchctl unload -w /System/Library/LaunchAgents/com.apple.notificationcenterui.plist 2> /dev/null


#
# Disable smart quotes as they’re annoying when typing code
#
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false


#
# Disable smart dashes as they’re annoying when typing code
#
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false


#
# Set a custom wallpaper image. `DefaultDesktop.jpg` is already a symlink, and
# all wallpapers are in `/Library/Desktop Pictures/`. The default is `Wave.jpg`.
#
# rm -rf ~/Library/Application Support/Dock/desktoppicture.db
# sudo rm -rf /System/Library/CoreServices/DefaultDesktop.jpg
# sudo ln -s /path/to/your/image /System/Library/CoreServices/DefaultDesktop.jpg


#
# Completely disable the Guest user
#
# sudo dscl . delete /Users/Guest
