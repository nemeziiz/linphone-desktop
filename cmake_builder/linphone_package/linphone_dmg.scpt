on run argv
  set image_name to item 1 of argv

  tell application "Finder"
  tell disk image_name

    -- open the image the first time and save a DS_Store with just
    -- background and icon setup
    open
      set current view of container window to icon view
      set theViewOptions to the icon view options of container window
      set background picture of theViewOptions to file ".background:background.jpg"
      set arrangement of theViewOptions to not arranged
      set icon size of theViewOptions to 100
      delay 1
    close

    -- next setup the position of the app and Applications symlink
    -- plus hide all the window decoration
    open
      update without registering applications
      tell container window
        set sidebar width to 0
        set statusbar visible to false
        set toolbar visible to false
        set the bounds to { 300, 100, 1000, 520 }
        set position of item "Linphone.app" to { 200, 280 }
        set position of item "Applications" to { 500, 280 }
      end tell
      update without registering applications
      delay 1
    close

    -- one last open and close so you can see everything looks correct
    open
      delay 5
    close

  end tell
  delay 1
  end tell
end run

