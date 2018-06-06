REQUIREMENTS_INSTALLED := $(CURDIR)/.installed

KEYS_DIR=~/.ssh/keys
SCRIPT_FILE=~/.switch_ssh_key_script.sh

requirements: $(REQUIREMENTS_INSTALLED)

$(REQUIREMENTS_INSTALLED): switch_ssh_key_script.sh
	@echo "Installing..."

	@cp ~/.ssh/id_rsa ~/.ssh/id_rsa.bk
	@cp ~/.ssh/id_rsa.pub ~/.ssh/id_rsa.pub.bk

	@mkdir $(KEYS_DIR)

	@chmod 700 $(KEYS_DIR)

	@cp ./switch_ssh_key_script.sh $(SCRIPT_FILE)
	@chmod +x $(SCRIPT_FILE)

	@echo "Append the following line to your .bashrc or .zshrc"
	@echo "source \"${HOME}/.switch_ssh_key_script.sh\""

	@touch $@