import os
import shutil
from pathlib import Path

vimrc_dir = Path.home()
coc_settings_dir = Path("~/.config/nvim").expanduser()

vimrc = vimrc_dir / ".vimrc"
coc_settings = coc_settings_dir / "coc-settings.json"

if not os.path.exists(vimrc):
    print("No already existing vimrc found")
    with open(vimrc, "w"):
        pass
else:
    print("Already existing vimrc found")
    shutil.copyfile(vimrc, vimrc_dir / ".vimrc.orig")
    print("Original vimrc --> .vimrc.orig")


if not os.path.exists(coc_settings):
    print("No already existing coc-settings.json found")
    with open(coc_settings, "w") as fp:
        pass
else:
    print("Already existing coc-settings.json found")
    shutil.copyfile(coc_settings, coc_settings_dir / "coc-settings.json.orig")
    print("Original coc-settings.json --> coc-settings.json.orig")

shutil.copyfile(".vimrc", vimrc)
shutil.copyfile("coc-settings.json", coc_settings)

to_delete_orig = input("Do you want to delete original files? y/[n]: ")

if to_delete_orig == "y":
    os.remove(vimrc_dir / ".vimrc.orig")
    os.remove(coc_settings_dir / "coc-settings.json.orig")

print("Vim setup done!")
