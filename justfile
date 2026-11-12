set export
rootdir := ''
prefix := '/usr'
theme-name := 'Cosmic-Custom'
base-dir := absolute_path(clean(rootdir / prefix))
install-dir := base-dir / 'share'
icons := install-dir / 'icons' / theme-name
export ICONS := icons

default:
    @just --list

install-freedesktop:
    @just freedesktop/install

install-extra:
    @just extra/install

install-index:
    install -Dm0644 ./index.theme {{icons}}/index.theme

# Install everything
install: (install-freedesktop) (install-extra) (install-index)

# Install directly to user directory ~/.local/share/icons/<theme-name> (no sudo needed)
install-user:
    @just prefix="{{env_var('HOME')}}/.local" install

# Uninstalls everything (requires same arguments as given to install)
uninstall:
    rm -rf {{icons}}

# Uninstalls from user directory
uninstall-user:
    @just prefix="{{env_var('HOME')}}/.local" uninstall

# Show the current git commit
git-rev:
    @git rev-parse --short HEAD
