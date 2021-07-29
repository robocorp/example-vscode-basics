# ********************************************************************************
# ****=========*========*========*========*========*========*========*========****
# **** WELCOME TO ROBOCORP'S ‘ONE-FILE’ TUTORIAL ON BUILDING ROBOTS IN VS CODE! ****
# ****=========*========*========*========*========*========*========*========****
# ********************************************************************************

# --------------------------------------------------------------------------------
# ============================= WHAT?! ROBOTS?! ==================================
# --------------------------------------------------------------------------------

# Yeah! Below this comment you can see a working robot written in Robot Framework syntax.
# It's simple; it opens Google Images, searches for a 'cute puppy', screenshots the first
# image it finds and then saves it to this robot workspace's 'output' directory.

# --NOTE--: We'll keep this mostly focused on robots within VS Code specifically but if
# you're confused by anything you see here we've got a great set of documentation over
# at https://robocorp.com/docs. There's even a beginner's course!

*** Settings ***
Documentation     Finds a cute puppy from Google
Library           RPA.Browser.Selenium
Task Teardown     Close All Browsers

*** Keywords ***
Accept Google Consent
    Click Element    xpath://button/div[contains(text(), 'I agree')]

*** Keywords ***
Find Image
    Open Available Browser    https://images.google.com
    Run Keyword And Ignore Error    Accept Google Consent
    Input Text    name:q    cute puppy
    Submit Form    # this is a 'selector' for targeting elements!
    ${first_image}=    Set Variable    css:div[data-ri=\"0\"]
    Wait Until Element Is Visible    ${first_image}
    Screenshot    ${first_image}    filename=%{ROBOT_ROOT}${/}output${/}image_from_google.png

*** Tasks ***
Find an Image from Google Images
    Find Image
# --------------------------------------------------------------------------------
# ============================ HOW DO I MAKE IT GO? ==============================
# --------------------------------------------------------------------------------
# Good question! You can try running the robot yourself by pressing `CTRL/CMD` + `SHIFT` + `P`
# to open VSCode's Command Palette, searching for `Robocorp: Run Robot` and then hitting
# `ENTER`. Give it a go!
#
# If all went well, you should see one cute pup in the 'output' directory in this workspace.
# That's not all that happened though! If you run the robot with a terminal window open to
# this workspace, you'll get a glimpse into the Python powering our robot's magic.
#
# --------------------------------------------------------------------------------
# ============================== COOL! WHAT ELSE? ================================
# --------------------------------------------------------------------------------
#
# Well, it's nice we can run our robot manually but wouldn't it be awesome if we
# could schedule it to run automatically? From anywhere?! Great! Well, let's put it
# in the Robocorp Cloud then.
#
# Open the Command Palette with `CTRL/CMD` + `SHIFT` + `P`, search for
# `Robocorp: Upload Robot To The Cloud`, hit `ENTER` and then `ENTER once again to
# be taken to the browser to login. After signing up/logging in, make sure you're at
# https://cloud.robocorp.com/settings/access-credentials, click the 'View' icon, copy
# your key and paste it into the (still-open) input bar. You're all ready to upload
# your robot!
#
# --------------------------------------------------------------------------------
# ================================= IS THAT ALL? ================================
# --------------------------------------------------------------------------------
#
# Yeah! Just remember that the Robocorp VS Code Extension gives you access to powerful
# commands for robot management through the Command Palette. They're easy to find as
# they all start with `Robocorp:`
#
# Why not try another now? Search for `Robocorp: Create Robot` and get busy building your
# own bot! We suggest the 'Standard' template for small bots like this, the 'Extended' template
# for a pre-defined possible large-scale robot architecture and the 'Python' template if you want
# to write your robots in Python! Good luck!
