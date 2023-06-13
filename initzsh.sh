echo "Installing zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
echo
echo "Setting new theme..."
sed -i "s/robbyrussel/tjkirch/g" ~/.zshrc
source ~/.zshrc
echo "Init success"
