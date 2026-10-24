# LG TV — NetCast Homebrew Test App

A minimal HTML/CSS/JavaScript application intended for compatibility testing on the LG 55LA970V-ZA (NetCast, firmware 04.28.17, reported SDK 03.05).

> **Important:** This repository is source code, not a confirmed installable NetCast package. The TV does not natively run Android APKs. We have not verified that LG's legacy App Test packaging service or USB developer workflow is still available for this model/firmware.

## Contents

- `app/index.html` — simple TV-friendly test application.
- `docs/usb-deployment.md` — cautious, conditional USB deployment notes.

## Local preview

From the repository root, start any simple static server, for example:

```sh
python -m http.server 8000 --directory app
```

Then open `http://127.0.0.1:8000` on your development computer.

## Next deployment steps

1. Verify whether the legacy LG NetCast SDK/App Test workflow can package an app for this TV.
2. Follow the exact instructions for the generated signed/DRM package, if that workflow is available.
3. Copy only the resulting package in the documented USB directory structure.
4. Test the application on the TV.

Do not rename this project ZIP or copy the raw source into the USB and assume the TV will install it. The package format and signing requirements must be confirmed first.
