sudo apt install libgtk-4-dev libadwaita-1-dev git
git clone https://github.com/ghostty-org/ghostty
cd ghostty
mise install zig
mise use zig
zig build -p $HOME/.local -Doptimize=ReleaseFast
gsettings set org.gnome.desktop.default-applications.terminal exec-arg "-x"
gsettings set org.gnome.desktop.default-applications.terminal exec /home/jaken/.local/bin/ghostty
cd ..
rm -rf ./ghostty
