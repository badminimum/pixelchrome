# Pixel Chrome Userstyles

[← Back to Main Project](https://github.com/badminimum/pixelchrome)

These styles are customized forks of the [Catppuccin Userstyles](https://github.com/catppuccin/userstyles/). By swapping a single import line and adding a new flavor, you can apply Pixel Chrome's aesthetic to your existing Catppuccin setups.

> [!TIP]
> New to userstyles? Check out the official [Catppuccin Usage Tutorial](https://userstyles.catppuccin.com/getting-started/usage/) for a deep dive.

## Prerequisites

You must have the **[Stylus browser extension](https://add0n.com/stylus.html)** installed.

## Installation Options

### Option 1: Install a Pixel Chrome Original

1. Navigate to the folder of the site you want to modify.
2. Open the `pixelchrome.user.less` file.
3. Click the **Raw** button at the top right of the file view.
4. Stylus will automatically detect the style; click **Install** in the new tab.

### Option 2: Convert an existing Catppuccin Style

If you already have a Catppuccin userstyle installed, you can "Pixel-ify" it:

1. Open your **Stylus Dashboard**.
2. Click the **Name** of the style to edit it.
3. Locate the library import line (usually at line 18) and replace it:

**Remove:**
`@import "https://userstyles.catppuccin.com/lib/lib.less";`

**Add:**
`@import "https://raw.githubusercontent.com/badminimum/pixelchrome/refs/heads/master/userstyles/pixelchrome.lib.less";`

4. Hit **Save** (Ctrl+S).

---

## Example Header

Your code block should look similar to this after the modification:

```css
/* ==UserStyle==
...
==/UserStyle== */

/* Swapping the default Catppuccin lib for Pixel Chrome */
/* @import "https://userstyles.catppuccin.com/lib/lib.less"; */
@import "https://raw.githubusercontent.com/badminimum/pixelchrome/refs/heads/master/userstyles/pixelchrome.lib.less";
```
