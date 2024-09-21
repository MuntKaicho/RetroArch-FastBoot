### RetroArch FastBoot Setup Instructions

1. **Unpack the `.zip` file**:
    - Extract the contents of the `.zip` file into the main RetroArch directory.
    - After extraction, the folder structure should look like this:
      ```
      \RetroArch\fastboot\
      ```

2. **Configure Cores for Each ROM Extension**:
    - Open the `settings.cfg` file located in the `fastboot` folder.
    - In this file, you’ll define which core (emulator) to use based on the file extension of your ROMs.
    - The format for each entry is as follows:
      ```
      ext=core.dll
      ```
      - **ext**: The file extension of your ROM (e.g., `sfc` for Super Nintendo games).
      - **core.dll**: The name of the core DLL file that RetroArch will use to run ROMs with that extension. You can find the core DLL files in the `\cores\` folder within your RetroArch installation.
      - Example:
        ```
        sfc=snes9x_libretro.dll
        nes=nestopia_libretro.dll
        gba=mgba_libretro.dll
        ```

3. **Associate ROM File Types with `RetroArch-FastBoot.cmd`**:
    - To make launching ROMs with FastBoot more seamless, you can associate specific ROM file types (e.g., `.sfc`, `.nes`, `.gba`) with the `RetroArch-FastBoot.cmd` script. This way, you can double-click a ROM file, and it will automatically launch RetroArch with the correct core.
    - Here's how to set up file associations in Windows:
      1. **Right-click on a ROM file** (e.g., a `.sfc` file) and select **"Open with"**.
      2. Click **"Choose another app"** (or **"More apps"** if needed).
      3. Select **"Look for another app on this PC"**.
      4. Navigate to the `fastboot` folder in your RetroArch directory and select `RetroArch-FastBoot.cmd`.
      5. Make sure to check the option that says **"Always use this app to open .sfc files"** (or whichever file extension you're associating).
      6. Click **OK** to save the association.

    - Repeat this process for each file extension you want to associate with `RetroArch-FastBoot.cmd` (e.g., `.nes`, `.gba`, etc.).

4. **That’s It!**:
    - Now, you can double-click any ROM file, and RetroArch FastBoot will automatically launch it with the correct core based on the file extension.

---

### Additional Notes

- **Specifying Core Names**: 
   - The core must be specified as a **`.dll` file** in the `settings.cfg`. 
   - You can find the respective core DLL files in your RetroArch installation under the following directory:
     ```
     \RetroArch\cores\
     ```
   - For example, to use the **Snes9x** core for `.sfc` ROMs, you would specify `snes9x_libretro.dll` as the core in `settings.cfg`.

With this setup, you’ll have a streamlined way to launch ROMs directly from your file explorer using the correct core for each system.
