ANSIBLE_COLLECTIONS_PATH=$(CURDIR)
export ANSIBLE_COLLECTIONS_PATH

# ANSIBLE_CALLBACKS_ENABLED=monkeyble_callback
# export ANSIBLE_CALLBACKS_ENABLED

.PHONY: tests
tests:
	@echo ANSIBLE_COLLECTIONS_PATH=$(ANSIBLE_COLLECTIONS_PATH)
	ansible-playbook tests/ansible_test/test_input/playbook.yml

requirements.txt: poetry.lock
	poetry export --without-hashes -f requirements.txt -o requirements.txt

.PHONY: install
install: requirements.txt
	poetry install

.PHONY: units
units:
	python3 -m unittest discover