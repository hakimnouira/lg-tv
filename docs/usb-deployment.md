# USB deployment notes

Target: LG 55LA970V-ZA, NetCast firmware 04.28.17, reported SDK 03.05.

## Build the experimental USB folder

From the repository root on Linux:

```bash
bash scripts/build-usb.sh
```

This creates `dist/netcast-usb/lgapps/installed/9000001/index.html` and a ZIP at `dist/netcast-usb.zip`.

To use another numeric folder name:

```bash
NETCAST_APP_ID=9000002 bash scripts/build-usb.sh
```

## Copy to the USB

The USB should remain NTFS and have `lgapps` at its root. Back up any existing app folders first. Copy the *contents* of `dist/netcast-usb/lgapps/` into the USB's existing `lgapps/` folder, so the final path is:

```
<USB>/lgapps/installed/9000001/index.html
```

Do not copy the `dist/netcast-usb` wrapper folder itself into `installed`, and do not copy the ZIP file into `installed`.

Then eject the USB safely, insert it into the port labelled USB Apps, open My Applications, and select the USB apps icon.

## Important limitations

This is an **experimental community-layout test**, not a verified installable package. LG's official NetCast testing workflow uses an app ZIP uploaded to App Test and then downloads a DRM-packaged file. This build script does not sign or DRM-package the app. If the TV still does not list the app, that strongly suggests this model/firmware requires the official package or a different app bundle layout; do not keep repeating the same USB test.

NetCast is not Android or webOS: APKs and webOS IPK packages are not appropriate.
