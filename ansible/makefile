install:
	ansible-galaxy install -r requirements.yml

deploy:
	ansible-playbook -i inventory.ini playbook.yml --tags deploy --ask-vault-pass

datadog:
	ansible-playbook -i inventory.ini playbook.yml --tags datadog --ask-vault-pass
