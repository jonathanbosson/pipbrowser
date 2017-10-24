## Picture-in-Picture Browser
Minimal browser window without any borders and set as always-on-top to allow for smooth browsing while using another program.
Perfect for single-monitor setups, watch netflix, youtube or twitch while working or playing. 

Pull requests or suggestions on improvements are welcomed!

### Dependencies

* [`AutoHotKey`](https://autohotkey.com/)
* `Google Chrome` - only required for current process id identification
* `Windows 7/8.1/10`


### Getting started

1. Download and install [`AutoHotKey`](https://autohotkey.com/)
2. Grab the latest [`version`](https://github.com/jonathanbosson/pipbrowser/archive/master.zip) and unpack the `.zip` file. 
3. Edit the top parameters in `pipbrowser.ahk` to your respective setup
4. Run the script

### Usage 

* Open help window: `ctrl+alt+h`
* Go to URL: `ctrl+alt+g`
* Open clipboard as URL: `ctrl+alt+f`
* Toggle PiP mode (always-on-top and invisible top-border): `ctrl+alt+z`
* Reset window position and size: `ctrl+alt+r`
* Make window larger: `ctrl+alt+l`
* Make window smaller: `ctrl+alt+k`

`ctrl+alt+f` is the same as `ctrl+alt+g` with the clipboard as address.
`ctrl+alt+z`-toggle scews the browser frame somewhat. If done too much, just reopen the page with `ctrl+alt+g`. 


### Add the script to your startup list by 
1. Right click on `pipbrowser.ahk` to make a shortcut of it
2. Press `win+r`, type `shell: Common Startup` and paste the shortcut in the opened directory


### Backlog (I'll add more as suggestions come)

* Logic for what URLs to automatically embed
* String matching with a user-defined `common pages`-list to quickly open websites through `ctrl+alt+g`
* Allow easy user definition of default window placement
* Arrow keys to jump between different window placements