sudo apt install libgtk-4-dev libadwaita-1-dev git
git clone https://github.com/ghostty-org/ghostty
cd ghostty
mise install zig
mise use zig
zig build -Doptimize=ReleaseFast -Dapp-runtime=glfw
gsettings set org.gnome.desktop.default-applications.terminal exec-arg "-x"
gsettings set org.gnome.desktop.default-applications.terminal exec $(which ghostty)
cd ..
rm -rf ./ghostty
