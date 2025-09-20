#!/bin/bash

# Neovim Configuration Installer
# This script installs nvim configuration from ibrahim317/dotfiles

set -e  # Exit on any error

# Configuration
GITHUB_REPO="ibrahim317/dotfiles"
CONFIG_DIR="$HOME/.config"
NVIM_SOURCE_DIR="nvim"
NVIM_DEST_DIR="$CONFIG_DIR/nvim"
BACKUP_SUFFIX=".backup.$(date +%Y%m%d_%H%M%S)"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Helper functions
print_info() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Check if we're in a git repository and get the remote URL
get_repo_url() {
    if git rev-parse --git-dir > /dev/null 2>&1; then
        git remote get-url origin 2>/dev/null || echo ""
    else
        echo "https://github.com/$GITHUB_REPO.git"
    fi
}

# Backup existing nvim config
backup_existing_config() {
    if [ -d "$NVIM_DEST_DIR" ]; then
        print_warning "Existing nvim configuration found at $NVIM_DEST_DIR"
        local backup_dir="$NVIM_DEST_DIR$BACKUP_SUFFIX"
        print_info "Creating backup: $backup_dir"

        if mv "$NVIM_DEST_DIR" "$backup_dir"; then
            print_success "Backup created successfully"
            return 0
        else
            print_error "Failed to create backup"
            return 1
        fi
    fi
    return 0
}

# Create config directory if it doesn't exist
create_config_dir() {
    if [ ! -d "$CONFIG_DIR" ]; then
        print_info "Creating $CONFIG_DIR directory"
        if mkdir -p "$CONFIG_DIR"; then
            print_success "Config directory created"
        else
            print_error "Failed to create config directory"
            return 1
        fi
    fi
}

# Install nvim configuration from GitHub
install_from_github() {
    local temp_dir=$(mktemp -d)
    local repo_url=$(get_repo_url)

    print_info "Cloning repository from: $repo_url"
    print_info "Temporary directory: $temp_dir"

    if git clone "$repo_url" "$temp_dir/repo"; then
        print_success "Repository cloned successfully"

        if [ -d "$temp_dir/repo/$NVIM_SOURCE_DIR" ]; then
            print_info "Copying nvim configuration to $NVIM_DEST_DIR"

            if cp -r "$temp_dir/repo/$NVIM_SOURCE_DIR" "$NVIM_DEST_DIR"; then
                print_success "Nvim configuration installed successfully"
            else
                print_error "Failed to copy nvim configuration"
                return 1
            fi
        else
            print_error "nvim directory not found in repository"
            return 1
        fi
    else
        print_error "Failed to clone repository"
        return 1
    fi

    # Cleanup
    rm -rf "$temp_dir"
}

# Install nvim configuration from local directory
install_from_local() {
    if [ -d "$NVIM_SOURCE_DIR" ]; then
        print_info "Installing from local $NVIM_SOURCE_DIR directory"

        if cp -r "$NVIM_SOURCE_DIR" "$NVIM_DEST_DIR"; then
            print_success "Nvim configuration installed successfully"
        else
            print_error "Failed to copy nvim configuration"
            return 1
        fi
    else
        print_error "Local $NVIM_SOURCE_DIR directory not found"
        return 1
    fi
}

# Main installation function
main() {
    print_info "Starting Neovim configuration installation"

    # Check if git is available
    if ! command -v git &> /dev/null; then
        print_warning "Git not found, trying to install from local directory"
        if ! install_from_local; then
            print_error "Installation failed"
            exit 1
        fi
    else
        # Try to backup existing config
        backup_existing_config

        # Create config directory
        create_config_dir || exit 1

        # Install from GitHub
        if ! install_from_github; then
            print_warning "GitHub installation failed, trying local installation"
            if ! install_from_local; then
                print_error "All installation methods failed"
                exit 1
            fi
        fi
    fi

    # Set proper permissions
    if [ -d "$NVIM_DEST_DIR" ]; then
        chmod -R u+rwX "$NVIM_DEST_DIR"
        print_success "Permissions set for nvim configuration"
    fi

    print_success "Neovim configuration installation completed!"
    print_info "You can now start nvim to use your new configuration"
    print_info "If you had a backup created, you can find it at: $NVIM_DEST_DIR$BACKUP_SUFFIX"
}

# Simple installation mode (for one-liner usage)
simple_install() {
    print_info "Running in simple mode - installing nvim config from GitHub"
    create_config_dir || exit 1
    local temp_dir
    temp_dir=$(mktemp -d)

    if git clone "https://github.com/ibrahim317/dotfiles.git" "$temp_dir/repo"; then
        if [ -d "$temp_dir/repo/nvim" ]; then
            # Backup existing config
            if [ -d "$NVIM_DEST_DIR" ]; then
                mv "$NVIM_DEST_DIR" "$NVIM_DEST_DIR.backup.$(date +%Y%m%d_%H%M%S)"
            fi

            # Install new config
            cp -r "$temp_dir/repo/nvim" "$NVIM_DEST_DIR"
            rm -rf "$temp_dir"
            print_success "Neovim configuration installed successfully!"
            print_info "You can now start nvim to use your new configuration"
            exit 0
        fi
    fi

    rm -rf "$temp_dir"
    print_error "Installation failed"
    exit 1
}

# Execute main logic when script is sourced or run
# This ensures the script works whether run directly or piped
if [[ "${0}" == "bash" ]] || [[ "${0}" == "/dev/stdin" ]] || [[ -n "${BASH_EXECUTION_STRING}" ]] || [[ -z "${BASH_SOURCE[0]}" ]] || [[ "${BASH_SOURCE[0]}" != "${0}" ]]; then
    # Check for simple mode flag
    if [[ "$1" == "--simple" ]]; then
        simple_install
    else
        main "$@"
    fi
fi
