# Exit when any command fails
set -e

OMZ_URL="https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh"

command_exists() {
  command -v "$@" >/dev/null 2>&1
}

# Check zsh installed
command_exists zsh || {
        # Install with apt if available
        command_exists apt || {
                # If no apt, install zsh yourself
                echo "Zsh is not installed. Install it first!"
                exit 1
        }
        echo "Installing zsh"
        sudo apt install zsh -y
}

echo "Installing Oh My Zsh..."
# CHSH=Change default shell to zsh after installation
# RUNZSH=Run zsh after installation. Set no to continue this script execution
CHSH=yes RUNZSH=no sh -c "$(curl -fsSL "$OMZ_URL")"

echo
echo "Setting new theme..."
sed -i "s/robbyrussell/tjkirch/g" ~/.zshrc
echo "Init success. Run zsh now or restart the terminal."
