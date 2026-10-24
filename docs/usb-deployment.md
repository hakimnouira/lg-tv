# USB deployment notes

Target: LG 55LA970V-ZA, NetCast firmware 04.28.17, reported SDK 03.05.

## Current status

The USB has been prepared with an NTFS filesystem and the path:

```
lgapps/installed/
```

That folder is currently only a destination directory. This repository does not yet contain a verified TV-installable package.

## Required checks before copying files

1. Confirm that the legacy LG NetCast SDK/App Test packaging workflow is still available.
2. Confirm the exact package format, signing/DRM requirements, and directory structure for this model and SDK.
3. Use the output of that supported packager—not the source HTML folder or a generic ZIP.
4. Only then place the generated package in the location specified by the matching documentation.

## Do not assume

- A normal Android APK can be installed by NetCast.
- Copying `app/index.html` to `lgapps/installed/` installs the app.
- An arbitrary ZIP is a valid NetCast package.
- Documentation for webOS or a different LG model applies to this TV.

If the legacy packaging service is unavailable, report that as a blocker and research alternatives before attempting firmware modifications or undocumented exploits.
