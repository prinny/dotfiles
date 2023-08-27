# Installation
1. Update the values for `HIDKeyboardModifierMappingSrc` and `HIDKeyboardModifierMappingDst` using the following format: `0x0x7000000##` where **##** is replaced with the last two digits of the *Usage ID* located on [this page](https://developer.apple.com/library/archive/technotes/tn2450/_index.html#//apple_ref/doc/uid/DTS40017618-CH1-KEY_TABLE_USAGES). Be sure to configure this twice in reverse order to swap keys with each other.
2. Place the script in the desired location (e.g., `/usr/local/bin/key-remapper.sh`).
3. Set up the script as a *Login Item*. Instructions can be found [here](https://support.apple.com/guide/mac-help/open-items-automatically-when-you-log-in-mh15189/mac).

# Example
| Usage ID | Key Name |
| -------- | -------- |
| 0x700000035 | Keyboard Grave Accent and Tilde |
| 0x700000039 | Keyboard Caps Lock |

```
#!/usr/bin/env zsh
hidutil property --set '{"UserKeyMapping":[{"HIDKeyboardModifierMappingSrc":0x700000035,"HIDKeyboardModifierMappingDst":0x700000039},{"HIDKeyboardModifierMappingSrc":0x700000039,"HIDKeyboardModifierMappingDst":0x700000035}]}'
```

# Known Issues
The script requires the user to successfully log-in. This is due to the script being configured as a *Login Item*, which by nature only runs after a user has logged in for the first time. Keep this in mind should your remapped key be one you use for your password.

# FAQ
Q. Why does this use `zsh`?

A. This is due to MacOS officially switching to `zsh` as its [default shell](https://support.apple.com/guide/terminal/change-the-default-shell-trml113/mac#:~:text=The%20default%20shell%20is%20zsh,windows%20and%20tabs%20open%20with.&text=In%20the%20Terminal%20app%20on,shell%20you%20want%20to%20use.). The script can be configured to work with bash by changing the shebang line to `#!/usr/bin/env bash`.
