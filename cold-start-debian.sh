#/bin/bash
set -e
if ! [ -f "/etc/debian_version" ];
then
echo "Script only supports debian as of now."
fi
sudo apt-get install -y curl build-essential
if ! type brew > /dev/null;
then
echo "Installing brew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
(echo; echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"') >> /home/jakob/.bashrc
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
brew install gcc
fi
echo "Installing zsh and oh-my-zsh..."
sudo apt-get install -y zsh
if [ ! -d "~/.oh-my-zsh"]; then
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi
echo "Installing fzf..."
brew install fzf
echo "Installing nerdfont..."
if [ ! -f "~/.local/share/fonts/JetBrainsMonoNLNerdFontMono-Medium.ttf"]; then
wget -P ~/.local/share/fonts https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/JetBrainsMono.zip \
&& cd ~/.local/share/fonts \
&& unzip -o JetBrainsMono.zip \
&& rm JetBrainsMono.zip \
&& fc-cache -fv
cd
fi
echo "Installing eza..."
brew install eza
echo "Installing zsh-syntax-highlighting"
brew install zsh-syntax-highlighting
if [ ! -d "~/.oh-my-zsh/plugins/zsh-auto-suggestions"]; then
echo "Installing zsh-autosuggestions"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
fi

echo "Installing neovim"
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
sudo rm -rf /opt/nvim
sudo tar -C /opt -xzf nvim-linux64.tar.gz
cp -R .config/nvim ~/.config 

echo "Installing lazygit"
brew install lazygit

if [ -f "~/.zshrc" ]; then
mv ~/.zshrc ~/.bak.zshrc
fi
cp .zshrc ~/


