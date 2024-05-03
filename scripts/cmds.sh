sudo apt update && sudo apt upgrade -y
sudo apt-get install tmux xclip zsh stow alacritty -y
sh ssh_gen.sh
git submodule update --init --recursive
echo 'alias clip=xclip -selection c' >> ~/.bashrc
souce ~/.bashrc
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
sudo apt -f install
rm google-chrome-stable_current_amd64.deb
sh nvim_install.sh
sh nerd_fonts.sh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
sudo chsh -s $(which zsh)
curl -fsSL https://tailscale.com/install.sh | sh
sudo tailscale up --ssh
wget https://dl.discordapp.net/apps/linux/0.0.45/discord-0.0.45.deb
sudo apt install ./discord-0.0.45.deb -y
rm ./discord-0.0.45.deb
